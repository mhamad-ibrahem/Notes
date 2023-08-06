import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notes/Global/Core/Class/StatusRequest.dart';
import 'package:notes/Local/modules/profile/controller/profile_controller.dart';
import 'package:notes/Local/modules/profile/model/user_model.dart';
import '../../../../Global/Core/Functions/checkInternetConnection.dart';
import '../../../../Global/Core/Services/services.dart';

class ProfileControllerImplement extends ProfileController {
  @override
  getUserData() async {
    log(Services.userId);
    statusRequest = StatusRequest.loading;
    update();
    await users.where('id', isEqualTo: Services.userId).get().then((value) {
      value.docs.forEach((element) {
        userModel = UserModel.fromJson(element.data() as Map<String, dynamic>);
        statusRequest = StatusRequest.none;
        update();
        log('${userModel.image}');
      });
    }, onError: (error) {
      log('$error');
      statusRequest = StatusRequest.failure;
      update();
      update();
    });
    // queries.docs.
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
