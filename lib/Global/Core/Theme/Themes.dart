import 'package:flutter/material.dart';
import '../Constant/Colors.dart';

class Themes {
  ThemeData currentTheme = Themes.lightsTheme;
  static ThemeData lightsTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: GlobalColors.white,
    textTheme: const TextTheme(
      displaySmall: TextStyle(
          color: GlobalColors.black,
          fontSize: 12,
          // fontFamily: ,
          fontWeight: FontWeight.w400),
      displayLarge: TextStyle(
          color: GlobalColors.black,
          fontSize: 16,
          // fontFamily:,
          fontWeight: FontWeight.w500),
      displayMedium: TextStyle(
          color: GlobalColors.black,
          fontSize: 20,
          // fontFamily: ,
          fontWeight: FontWeight.bold),
    ),
  );
}
