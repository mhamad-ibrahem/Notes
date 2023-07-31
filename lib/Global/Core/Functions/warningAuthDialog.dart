import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../Constant/Colors.dart';

warningAuthDialog(String subTitle) {
  Get.defaultDialog(
      title: 'Warning',
      middleText: subTitle,
      middleTextStyle: const TextStyle(
          color: GlobalColors.black, fontSize: 17, fontWeight: FontWeight.w500),
      titleStyle: const TextStyle(
          color: GlobalColors.red, fontSize: 24, fontWeight: FontWeight.bold));
}


