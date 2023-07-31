import 'package:get/get.dart';

import '../../chat/controller/chat_controller.dart';
import '../../home/controller/home_controller.dart';
import '../controller/main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ChatDetsilsController());
    Get.put(HomeController());
    Get.put(MainController());
  }
}
