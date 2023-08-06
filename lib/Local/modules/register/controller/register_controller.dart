import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
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
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  register() async {
    var formData = formKey.currentState;
    if (formData!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      try {
        // final credential =
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
          email: email.text.trim(),
          password: password.text.trim(),
        )
            .then((value) {
          String id = value.user!.uid;
          addUser(id);
          statusRequest = StatusRequest.none;
          update();
        }, onError: (error) {
          log('$error');
          AppToasts.errorToast('$error');
          statusRequest = StatusRequest.failure;
          update();
        });
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
          AppToasts.errorToast('The password provided is too weak');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
          AppToasts.errorToast('The account already exists for that email');
        }
        statusRequest = StatusRequest.failure;
        update();
      } catch (e) {
        AppToasts.errorToast('$e');
        log('$e');
        statusRequest = StatusRequest.failure;
        update();
      }
    }
    update();
  }

  addUser(String id) async {
    users.add(
      {
        'id': id,
        'email': email.text,
        'name': name.text,
        'number': number.text,
        'password': password.text,
        'image': null,
      },
    ).then((value) {
      Get.toNamed(AppRoute.login);
      AppToasts.successToast(
          'Success create account please verify your email and log in now');
    }).catchError((e) {
      AppToasts.errorToast('Fail $e');
    });
  }
}

//await FirebaseAuth.instance.signOut();
