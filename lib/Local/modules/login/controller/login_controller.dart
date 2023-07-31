import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:notes/Global/Core/Class/app_toast.dart';
import 'package:notes/Local/Core/Constant/Routes.dart';

import '../../../../Global/Core/Class/StatusRequest.dart';

class LoginController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController number = TextEditingController();
  StatusRequest statusRequest = StatusRequest.none;
  String loginMythod = 'Email';
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
          update();
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
          AppToasts.errorToast('No user found for that email');
          statusRequest = StatusRequest.faliure;
          update();
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
          AppToasts.errorToast('Wrong password provided');
          statusRequest = StatusRequest.faliure;
          update();
        }
      } catch (e) {
        print('error catch $e');
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
    return await FirebaseAuth.instance.signInWithCredential(credential);
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
          statusRequest = StatusRequest.faliure;
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
          statusRequest = StatusRequest.faliure;
          update();
        },
      );
      update();
    }
    update();
  }

  changeLoginMethod(String mythod) {
    loginMythod = mythod;
    update();
  }
}
