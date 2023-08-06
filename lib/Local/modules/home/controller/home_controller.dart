import 'dart:developer';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notes/Global/Core/Class/StatusRequest.dart';
import 'package:notes/Global/Core/Class/app_toast.dart';
import 'package:notes/Global/Core/Services/services.dart';
import 'package:notes/Local/modules/home/model/notes_model.dart';

import '../../../../Global/Core/Functions/checkInternetConnection.dart';

class HomeController extends GetxController {
  List<NotesModel> notesList = [];
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference notes = FirebaseFirestore.instance.collection('notes');
  StatusRequest statusRequest = StatusRequest.none;
  ScrollController scrollController = ScrollController();
  bool canReGet = true;
  bool loadingDeleteButton = false;
  bool isFetching = false;
  bool isLoading = false;
  bool isError = false;
  bool isEmpty = false;
  int quantity = 10;
  int last = 100;
  getNotesData() async {
    if (quantity == 10) {
      isLoading = true;
      update();
    } else {
      isFetching = true;
      update();
    }
    isError = false;
    update();
    try {
      QuerySnapshot queries = await notes
          .where(
            'user id',
            isEqualTo: Services.userId,
          )
          .limit(quantity)
          .get();
      List<QueryDocumentSnapshot> documentList = queries.docs;
      notesList.clear();
      documentList.forEach((element) {
        notesList.add(NotesModel.fromJson(
            element.data() as Map<String, dynamic>, element.id));
        log('${element.data()}');
        log('${notesList.length}');
      });
      if (quantity == 10) {
        isLoading = false;
        update();
      } else {
        isFetching = false;
        update();
      }
    } catch (e) {
      log('$e');
      isError = true;
      update();
    }
    update();
  }

  paginate() async {
    log("pagination .................................");
    scrollController.addListener(() {
      if (scrollController.offset ==
              scrollController.position.maxScrollExtent &&
          !isFetching &&
          isEmpty == false) {
        quantity += 10;
        if (notesList.length < last) {
          log(notesList.length.toString());
          log(last.toString());
          getNotesData();
        }
      }
    });
  }

  resetPaginate() {
    quantity = 10;
    last = 100;
    isFetching = false;
    isEmpty = false;
    notesList.clear();
    update();
  }

  reGetImage() async {
    if (await checkInternet()) {
      canReGet = false;
      update();
    }
    await Future.delayed(const Duration(seconds: 2));

    canReGet = true;
  }

  removeNote(int i) async {
    notesList[i].isDeleteLoading = true;
    update();
    await notes.doc(notesList[i].notesId).delete().then((value) async {
      await FirebaseStorage.instance
          .refFromURL("${notesList[i].image}")
          .delete();
      notesList.removeAt(i);
      AppToasts.successToast('Deleted successfully');
      update();
    }, onError: (error) {
      log('$error');
      AppToasts.errorToast('Deleted Fail');
      notesList[i].isDeleteLoading = false;
      update();
    });
    update();
  }

  @override
  void onInit() {
    getNotesData();
    paginate();
    super.onInit();
  }
}
