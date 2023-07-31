import 'package:get/get.dart';
import 'package:notes/Local/modules/otp/controller/otp_controller.dart';

class OtpBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(OtpController());
  }
}
