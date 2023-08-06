import 'dart:developer';
import 'dart:io';
import 'package:notes/Local/modules/home/model/notes_model.dart';
import 'package:path/path.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:notes/Global/Core/Class/StatusRequest.dart';
import 'package:notes/Global/Core/Class/app_toast.dart';
import 'package:notes/Local/modules/home/controller/home_controller.dart';

import '../../../../Global/Core/Services/services.dart';

class AddNotesController extends GetxController {
  HomeController controller = Get.find();
  final TextEditingController title = TextEditingController();
  final TextEditingController subTitle = TextEditingController();
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  DateTime now = DateTime.now();
  final formKey = GlobalKey<FormState>();
  FirebaseFirestore fireStore = FirebaseFirestore.instance;
  CollectionReference notes = FirebaseFirestore.instance.collection('notes');
  StatusRequest statusRequest = StatusRequest.none;
  File? image;
  String imageName = '';
  final imagePicker = ImagePicker();
  uploadGalleryImage() async {
    Get.back();
    var pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      image = File(pickedImage.path);
      imageName = basename(pickedImage.path);
      print(image);
      update();
    }
  }

  uploadCameraImage() async {
    Get.back();
    var pickedImage = await imagePicker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      image = File(pickedImage.path);
      imageName = basename(pickedImage.path);
      print(image);
      update();
    } else {}
  }

  removeImage() async {
    image = null;
    imageName = '';
    update();
  }

  addNotes() async {
    var formData = formKey.currentState;
    if (formData!.validate() && image != null) {
      final String date = formatter.format(now);
      print(date);
      statusRequest = StatusRequest.loading;
      update();
      var fireStorage = FirebaseStorage.instance.ref('notes/$imageName');
      FirebaseFirestore.instance.runTransaction((transaction) async {
        await fireStorage.putFile(image!).then((p0) async {
          var imageUrl = await fireStorage.getDownloadURL();
          notes.add(
            {
              'title': title.text,
              'sub_title': subTitle.text,
              'image': imageUrl,
              'date': date,
              'user id': Services.userId,
            },
          ).then((value) {
            statusRequest = StatusRequest.none;
            update();
            NotesModel note = NotesModel(
                title: title.text,
                date: date,
                image: imageUrl,
                userId: Services.userId,
                subTitle: subTitle.text,
                notesId: value.id);
            controller.notesList.add(note);
            controller.update();
            Get.back();
            AppToasts.successToast('Success');
          }).catchError((e) {
            AppToasts.errorToast('Fail $e');
            log('$e');
            statusRequest = StatusRequest.none;
            update();
          });
        }, onError: (error) {
          AppToasts.errorToast('Fail $error');
          log('$error');
          statusRequest = StatusRequest.none;
          update();
        });
      });
    } else {
      AppToasts.errorToast('Valid form and choose image to add note');
    }
  }
}
