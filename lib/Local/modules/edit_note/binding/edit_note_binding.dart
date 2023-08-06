import 'package:get/get.dart';
import 'package:notes/Local/modules/edit_note/controller/edit_note_controller.dart';

class EditNoteBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(EditNoteController());
  }
}
