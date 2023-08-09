import 'package:flutter/material.dart';

import '../../Core/Constant/Colors.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      indent: 10,
      color: AppColors.lgrey,
      thickness: 2,
    );
  }
}
