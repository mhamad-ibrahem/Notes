import 'package:flutter/material.dart';
import '../../../Global/Core/Constant/Colors.dart';
import 'package:get/get.dart';

class CustomExitButton extends StatelessWidget {
  const CustomExitButton({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 20,
      backgroundColor: GlobalColors.red.withOpacity(0.4),
      child: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: const Icon(Icons.close),
        color: GlobalColors.white,
      ),
    );
  }
}
