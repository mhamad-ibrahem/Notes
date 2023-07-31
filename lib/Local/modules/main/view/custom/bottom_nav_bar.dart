import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes/Local/Core/Constant/Colors.dart';
import '../../controller/main_controller.dart';

class MainNavBar extends StatelessWidget {
  MainNavBar({super.key});
  final MainController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      backgroundColor: Colors.transparent,
      buttonBackgroundColor: AppColors.primaryColor,
      color: Colors.black87,
      items: controller.navBarIcons,
      onTap: (index) {
        controller.changePage(index);
      },
    );
  }
}
