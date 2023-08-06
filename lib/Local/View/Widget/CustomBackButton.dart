import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Core/Constant/Colors.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
    this.color,
    this.size,
  });
  final Color? color;
  final double? size;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Get.back();
      },
      icon: Icon(
        GetPlatform.isAndroid
            ? Icons.arrow_back_rounded
            : Icons.arrow_back_ios_rounded,
        size: size ?? 25,
      ),
      color: color ?? AppColors.primaryColor,
    );
  }
}
