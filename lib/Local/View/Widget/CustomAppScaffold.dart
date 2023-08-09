import 'package:flutter/material.dart';
import 'package:notes/Local/View/Widget/custom_app_bar.dart';

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
      appBar: customAppBar(context: context, title: pageTitle, isBack: isBack),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(), child: widget),
      ),
    ));
  }
}
