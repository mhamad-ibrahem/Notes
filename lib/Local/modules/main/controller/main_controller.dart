import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes/Global/Core/Constant/Colors.dart';
import 'package:notes/Local/modules/chat/view/chat.dart';
import 'package:notes/Local/modules/home/view/home.dart';
import 'package:notes/Local/modules/profile/view/profile_page.dart';

class MainController extends GetxController {
  // final autoSizeGroup = AutoSizeGroup();
  int bottomNavIndex = 0;
  Widget selectedPage = HomePage();
  List<Widget> pages = [
    HomePage(),
    ChatPage(),
    ProfilePage(),
  ];
  List<Widget> navBarIcons = [
    const Icon(
      Icons.home,
      size: 30,
      color: GlobalColors.white,
    ),
    const Icon(Icons.chat, size: 30, color: GlobalColors.white),
    const Icon(Icons.person, size: 30, color: GlobalColors.white),
  ];

  changePage(index) {
    bottomNavIndex = index;
    selectedPage = pages[index];
    update();
  }
}
