import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../../Global/Core/Class/StatusRequest.dart';
import '../../../Core/Constant/Routes.dart';

class OtpController extends GetxController {
  String number = Get.arguments["phoneNumber"];
  FirebaseAuth auth = FirebaseAuth.instance;
  String verificationId = Get.arguments["verificationId"];
  int? forceResendingToken = Get.arguments["forceResendingToken"];
  StatusRequest statusRequest = StatusRequest.none;
  login(String smsCode) async {
    PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: smsCode);
    statusRequest = StatusRequest.loading;
    update();
    try {
      await auth.signInWithCredential(phoneAuthCredential);
      Get.offAllNamed(AppRoute.main);
      statusRequest = StatusRequest.none;
      update();
    } catch (e) {
      statusRequest = StatusRequest.failure;
      update();
      log("$e");
    }
    update();
  }
}
