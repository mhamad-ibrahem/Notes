import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Core/Constant/Colors.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Get.back();
      },
      icon: Icon(GetPlatform.isAndroid
          ? Icons.arrow_back_rounded
          : Icons.arrow_back_ios_rounded),
      color: AppColors.primaryColor,
    );
  }
}
