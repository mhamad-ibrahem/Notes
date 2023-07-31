import 'package:flutter/material.dart';

import '../../../Global/Core/Constant/Colors.dart';
import 'Colors.dart';
import 'FontFamily.dart';

TextStyle primaryTextStyle(bool isUnderLine) {
  return TextStyle(
      color: AppColors.primaryColor,
      fontSize: 22,
      fontFamily: AppFontFamily.appFontFamily,
      decoration:
          isUnderLine == true ? TextDecoration.underline : TextDecoration.none,
      fontWeight: FontWeight.w600);
}

TextStyle buttonTextStyle() {
  return const TextStyle(
      color: GlobalColors.white,
      fontSize: 15,
      fontFamily: AppFontFamily.appFontFamily,
      fontWeight: FontWeight.w600);
}

TextStyle textFormStyle() {
  return const TextStyle(
      color: GlobalColors.black,
      fontSize: 15,
      fontFamily: AppFontFamily.appFontFamily,
      fontWeight: FontWeight.bold);
}

TextStyle appBarStyle() {
  return const TextStyle(
      color: GlobalColors.black,
      fontSize: 15,
      fontFamily: AppFontFamily.appFontFamily,
      fontWeight: FontWeight.bold);
}
