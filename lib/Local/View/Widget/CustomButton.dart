import 'package:flutter/material.dart';
import 'package:notes/Local/View/Shared/loading_points.dart';

import '../../../Global/Core/Constant/Colors.dart';
import '../../Core/Constant/Colors.dart';
import '../../Core/Constant/TextStyles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.buttonBody,
    required this.onTap,
    required this.buttonWidth,
    this.hight,
    this.isSelected,
    this.isLoading = false,
  }) : super(key: key);
  final double buttonWidth;
  final VoidCallback? onTap;
  final String buttonBody;
  final double? hight;
  final bool? isSelected;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      color: isSelected == true ? GlobalColors.white : AppColors.primaryColor,
      disabledColor: AppColors.primaryColor,
      disabledTextColor: GlobalColors.white,
      height: hight ?? 50,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: isSelected == true
              ? const BorderSide(color: GlobalColors.black)
              : BorderSide.none),
      child: SizedBox(
        width: buttonWidth,
        child: Center(
          child: isLoading == false
              ? Text(
                  buttonBody,
                  style: buttonTextStyle().copyWith(
                      color: isSelected == true
                          ? AppColors.primaryColor
                          : GlobalColors.white),
                )
              : const LoadingPoint(),
        ),
      ),
    );
  }
}
