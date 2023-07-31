import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:notes/Global/Core/Class/app_toast.dart';
import 'package:notes/Local/Core/Constant/Routes.dart';
import 'package:notes/Local/modules/home/controller/home_controller.dart';

class AddNotesController extends GetxController {
  HomeController controller = Get.find();
  final TextEditingController title = TextEditingController();
  final TextEditingController subTitle = TextEditingController();
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  DateTime now = DateTime.now();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference notes = FirebaseFirestore.instance.collection('notes');
  bool loadinButton = false;
  addNotes() async {
    final String date = formatter.format(now);
    print(date);
    loadinButton = true;
    update();
    notes.add(
      {
        'title': title.text,
        'sub_title': subTitle.text,
        'image':
            'https://th.bing.com/th/id/R.36d0a7769cddeac05887f5f338d45065?rik=0qJU1UXeVyk2bQ&pid=ImgRaw&r=0',
        'date': date,
        'user id': 'lfTxZaR19zLFuHlKZgoA',
      },
    ).then((value) {
      loadinButton = false;
      update();
      controller.getNotesData();
      Get.offAllNamed(AppRoute.main);
      AppToasts.successToast('Success');
    }).catchError((e) {
      AppToasts.errorToast('Fail $e');
      print(e);
      loadinButton = false;
      update();
    });
  }

  updateNotes() async {
    final String date = formatter.format(now);
    loadinButton = true;
    update();

    notes.doc('note id').set({
      'title': title.text,
      'sub_title': subTitle.text,
      'image':
          'https://th.bing.com/th/id/R.36d0a7769cddeac05887f5f338d45065?rik=0qJU1UXeVyk2bQ&pid=ImgRaw&r=0',
      'date': date,
    }, SetOptions(merge: true)).then((value) {
      loadinButton = false;
      update();
      Get.offAllNamed(AppRoute.main);
      AppToasts.successToast('success');
    }).catchError((e) {
      AppToasts.errorToast('$e');
      print(e);
      loadinButton = false;
      update();
    });
  }

  deleteNote() async {
    loadinButton = true;
    update();
    notes.doc('note id').delete().then((value) {}).catchError((e) {});
  }
}
