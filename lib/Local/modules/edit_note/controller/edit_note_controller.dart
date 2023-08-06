// import 'dart:developer';
import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:notes/Local/modules/home/controller/home_controller.dart';
import 'package:notes/Local/modules/home/model/notes_model.dart';
import '../../../../Global/Core/Class/StatusRequest.dart';
import '../../../../Global/Core/Class/app_toast.dart';
import '../../../../Global/Core/Functions/checkInternetConnection.dart';
import 'package:path/path.dart';
import '../../../../Global/Core/Services/services.dart';

class EditNoteController extends GetxController {
  HomeController controller = Get.find();
  final TextEditingController title = TextEditingController();
  final TextEditingController subTitle = TextEditingController();
  DateTime now = DateTime.now();
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  final formKey = GlobalKey<FormState>();
  FirebaseFirestore fireStore = FirebaseFirestore.instance;
  CollectionReference notes = FirebaseFirestore.instance.collection('notes');
  StatusRequest statusRequest = StatusRequest.none;
  File? image;
  String? imageName;
  final imagePicker = ImagePicker();
  bool canReGet = true;
  late NotesModel notesModel;
  bool isEnableEditing = false;
  @override
  void onInit() {
    notesModel = Get.arguments;
    title.text = notesModel.title;
    subTitle.text = notesModel.subTitle;
    imageName = notesModel.image;
    log('$imageName');
    super.onInit();
  }

  reGetImage() async {
    if (await checkInternet()) {
      canReGet = false;
      update();
    }
    await Future.delayed(const Duration(seconds: 2));

    canReGet = true;
  }

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

  enableEditing() {
    isEnableEditing = true;
    update();
  }

  updateNotes() async {
    var formData = formKey.currentState;
    if (formData!.validate() && imageName != null) {
      statusRequest = StatusRequest.loading;
      final String date = formatter.format(now);
      update();
      var fireStorage = FirebaseStorage.instance.ref('notes/$imageName');
      FirebaseFirestore.instance.runTransaction((transaction) async {
        await fireStorage.putFile(image!).then((p0) async {
          await FirebaseStorage.instance.refFromURL(notesModel.image).delete();
          var imageUrl = await fireStorage.getDownloadURL();
          updateDataWithOutImage() async {
            notes.doc(notesModel.notesId).set({
              'title': title.text,
              'sub_title': subTitle.text,
              'image': imageUrl,
              'date': date,
              'user id': Services.userId,
            }, SetOptions(merge: true)).then((value) {
              statusRequest = StatusRequest.none;
              update();
              NotesModel note = NotesModel(
                  title: title.text,
                  date: date,
                  image: imageUrl,
                  userId: Services.userId,
                  subTitle: subTitle.text,
                  notesId: notesModel.notesId);
              controller.notesList
                  .removeWhere((element) => element.image == notesModel.image);
              controller.notesList.add(note);
              controller.update();
              Get.back();

              AppToasts.successToast('success');
            }).catchError((e) {
              AppToasts.errorToast('$e');
              print(e);
              statusRequest = StatusRequest.none;
              update();
            });
          }
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

  updateDataWithOutImage() async {
    var formData = formKey.currentState;
    if (formData!.validate() && imageName != null) {
      statusRequest = StatusRequest.loading;
      final String date = formatter.format(now);
      update();
      notes.doc(notesModel.notesId).set({
        'title': title.text,
        'sub_title': subTitle.text,
        'date': date,
        'user id': Services.userId,
      }, SetOptions(merge: true)).then((value) {
        statusRequest = StatusRequest.none;
        update();
        NotesModel note = NotesModel(
            title: title.text,
            date: date,
            image: notesModel.image,
            userId: Services.userId,
            subTitle: subTitle.text,
            notesId: notesModel.notesId);
        controller.notesList
            .removeWhere((element) => element.image == notesModel.image);
        controller.notesList.add(note);
        controller.update();
        Get.back();

        AppToasts.successToast('success');
      }).catchError((e) {
        AppToasts.errorToast('$e');
        print(e);
        statusRequest = StatusRequest.none;
        update();
      });
    }
  }
}
