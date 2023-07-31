import 'package:get/get.dart';
import 'package:notes/Local/modules/add_notes/controller/add_notes_controller.dart';

class AddNotesBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AddNotesController());
  }
}
