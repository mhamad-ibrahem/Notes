import 'package:flutter/material.dart';
import '../../Core/Constant/TextStyles.dart';
import 'CustomBackButton.dart';

class CustomAppScaffold extends StatelessWidget {
  const CustomAppScaffold(
      {super.key,
      required this.pageTitle,
      required this.widget,
      required this.isBack});
  final String pageTitle;
  final Widget widget;
  final bool isBack;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(
          pageTitle,
          style: appBarStyle(),
        ),
        centerTitle: true,
        leading: isBack ? const CustomBackButton() : null,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(), child: widget),
      ),
    ));
  }
}
