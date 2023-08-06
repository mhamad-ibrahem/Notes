import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../Core/Constant/TextStyles.dart';
import 'CustomBackButton.dart';

customAppBar(
    {required BuildContext context,
    required String title,
    required bool isBack}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: Text(
      title,
      style: appBarStyle(),
    ),
    centerTitle: true,
    leading: isBack ? const CustomBackButton() : null,
  );
}
