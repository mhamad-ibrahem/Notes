import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes/Global/Core/Class/StatusRequest.dart';
import 'package:notes/Global/Core/Class/app_toast.dart';
import 'package:notes/Local/Core/Constant/Routes.dart';

class RegisterController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController number = TextEditingController();
  StatusRequest statusRequest = StatusRequest.none;
  final formKey = GlobalKey<FormState>();
  register() async {
    var formData = formKey.currentState;
    if (formData!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      try {
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text.trim(),
          password: password.text.trim(),
        );
        Get.offAllNamed(AppRoute.login);
        AppToasts.successToast(
            'Success create account please verifay your email and log in now');
        statusRequest = StatusRequest.none;
        update();
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
          AppToasts.errorToast('The password provided is too weak');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
          AppToasts.errorToast('The account already exists for that email');
        }
        statusRequest = StatusRequest.faliure;
        update();
      } catch (e) {
        AppToasts.errorToast('$e');
        print(e);
        statusRequest = StatusRequest.faliure;
        update();
      }
    }
    update();
  }
}

//await FirebaseAuth.instance.signOut();
