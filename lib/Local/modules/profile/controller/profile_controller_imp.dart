import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:notes/Global/Core/Class/StatusRequest.dart';
import 'package:notes/Local/modules/profile/controller/profile_controller.dart';
import 'package:notes/Local/modules/profile/model/user_model.dart';
import '../../../../Global/Core/Class/HiveBox.dart';
import '../../../../Global/Core/Functions/checkInternetConnection.dart';
import '../../../../Global/Core/Services/services.dart';
import '../../../Core/Constant/Routes.dart';

class ProfileControllerImplement extends ProfileController {
  @override
  getUserData() async {
    statusRequest = StatusRequest.loading;
    update();
    await users.where('id', isEqualTo: Services.userId).get().then((value) {
      value.docs.forEach((element) {
        userModel = UserModel.fromJson(element.data() as Map<String, dynamic>);
        statusRequest = StatusRequest.none;
        update();
      });
    }, onError: (error) {
      log('$error');
      statusRequest = StatusRequest.failure;
      update();
      update();
    });
  }

  logOut() async {
    await FirebaseAuth.instance.signOut().then((value) async {
      await Hive.box(HiveBox.authBox).clear();
      Services.userId = '';
      update();
      Get.offAllNamed(AppRoute.register);
    });
  }

  @override
  void onInit() {
    getUserData();
    super.onInit();
  }

  @override
  reDownloadImage() async {
    if (await checkInternet()) {
      canReGet = false;
      update();
    }
    await Future.delayed(const Duration(seconds: 2));
    canReGet = true;
  }
}
