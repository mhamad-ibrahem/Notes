import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive/hive.dart';
import 'package:notes/Global/Core/Class/HiveBox.dart';
import 'package:notes/Global/Core/Class/HiveKeys.dart';
import 'package:notes/Global/Core/Class/app_toast.dart';
import 'package:notes/Global/Core/Services/services.dart';
import 'package:notes/Local/Core/Constant/Routes.dart';

import '../../../../Global/Core/Class/StatusRequest.dart';

class LoginController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController number = TextEditingController();
  StatusRequest statusRequest = StatusRequest.none;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  String loginMethod = 'Email';
  Box authBox = Hive.box(HiveBox.authBox);
  final formKey = GlobalKey<FormState>();
  login() async {
    var formData = formKey.currentState;
    if (formData!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      log('email login');
      try {
        final credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: email.text.trim(), password: password.text.trim());
        if (credential.user!.emailVerified == false) {
          AppToasts.errorToast(
              'PLease check your email and verifay it to login');
          User? user = FirebaseAuth.instance.currentUser;
          await user!.sendEmailVerification();
          statusRequest = StatusRequest.none;
          update();
        } else {
          Get.offAllNamed(AppRoute.main);
          statusRequest = StatusRequest.none;
          AppToasts.successToast('Login Success');
          log(credential.user!.uid);
          authBox.put(HiveKeys.idKey, credential.user!.uid);
          Services.userId = authBox.get(HiveKeys.idKey);
          update();
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
          AppToasts.errorToast('No user found for that email');
          statusRequest = StatusRequest.failure;
          update();
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
          AppToasts.errorToast('Wrong password provided');
          statusRequest = StatusRequest.failure;
          update();
        }
      } catch (e) {
        log('error catch $e');
      }
      update();
    }
  }

  loginWithGoogle() async {
    log('google login');
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance
        .signInWithCredential(credential)
        .then((value) {
      log(value.user!.uid);
      authBox.put(HiveKeys.idKey, value.user!.uid);
      Services.userId = authBox.get(HiveKeys.idKey);

      users.add(
        {
          'id': value.user!.uid,
          'email': value.user!.email,
          'name': value.user!.displayName,
          'number': number.text,
          'password': password.text,
          'image': null,
        },
      ).then((value) {
        Get.offAllNamed(AppRoute.main);
        statusRequest = StatusRequest.none;
        AppToasts.successToast('Login Success');

        update();
      }).catchError((e) {
        AppToasts.errorToast('Fail $e');
      });
    });
  }

  otpLogin() async {
    var formData = formKey.currentState;
    if (formData!.validate()) {
      log('Number login');
      FirebaseAuth auth = FirebaseAuth.instance;
      statusRequest = StatusRequest.loading;
      update();
      print('+962${number.text.trim()}');
      await auth.verifyPhoneNumber(
        phoneNumber: '+962${number.text.trim()}',
        verificationCompleted: (PhoneAuthCredential credential) async {},
        codeAutoRetrievalTimeout: (String verificationId) {
          print('offline');
          statusRequest = StatusRequest.failure;
          update();
        },
        codeSent: (String verificationId, int? forceResendingToken) {
          Get.toNamed(
            AppRoute.otp,
            arguments: {
              "verificationId": verificationId,
              "forceResendingToken": forceResendingToken,
              "phoneNumber": '+962${number.text.trim()}',
            },
          );
          print('success');
          statusRequest = StatusRequest.success;
          update();
        },
        verificationFailed: (FirebaseAuthException error) {
          log("$error");
          statusRequest = StatusRequest.failure;
          update();
        },
      );
      update();
    }
    update();
  }

  changeLoginMethod(String method) {
    loginMethod = method;
    update();
  }
}
