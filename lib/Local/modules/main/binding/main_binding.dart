import 'package:get/get.dart';
import 'package:notes/Local/modules/profile/controller/profile_controller_imp.dart';

import '../../chat/controller/chat_controller.dart';
import '../../home/controller/home_controller.dart';
import '../controller/main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ChatDetsilsController());
    Get.put(HomeController());
    Get.put(ProfileControllerImplement());
    Get.put(MainController());
  }
}
