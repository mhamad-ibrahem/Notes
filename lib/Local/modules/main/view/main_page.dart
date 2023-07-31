import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes/Local/modules/main/controller/main_controller.dart';
import 'package:notes/Local/modules/main/view/custom/bottom_nav_bar.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});
  final MainController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<MainController>(
        builder: (controller) => Scaffold(
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: MainNavBar(),
            //other params
            body: controller.selectedPage),
      ),
    );
  }
}
