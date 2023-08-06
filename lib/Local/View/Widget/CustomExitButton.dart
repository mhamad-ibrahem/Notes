import 'package:flutter/material.dart';
import '../../../Global/Core/Constant/Colors.dart';
import 'package:get/get.dart';

class CustomExitButton extends StatelessWidget {
  const CustomExitButton({
    super.key,
    this.color,
    this.radius,
    this.onTap,
  });
  final Color? color;
  final double? radius;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius ?? 20,
      backgroundColor: color ?? GlobalColors.red.withOpacity(0.4),
      child: Center(
        child: GestureDetector(
          onTap: onTap ??
              () {
                Get.back();
              },
          child: const Icon(
            Icons.close,
            color: GlobalColors.white,
          ),
        ),
      ),
    );
  }
}
