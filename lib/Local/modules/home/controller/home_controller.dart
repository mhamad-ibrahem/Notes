import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notes/Global/Core/Class/StatusRequest.dart';
import 'package:notes/Local/modules/home/model/notes_model.dart';

class HomeController extends GetxController {
  List<NotesModel> notesList = [];
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference notes = FirebaseFirestore.instance.collection('notes');
  StatusRequest statusRequest = StatusRequest.none;
  ScrollController scrollController = ScrollController();
  bool isFetching = false;
  bool isLoading = false;
  bool isError = false;
  bool isEmpty = false;
  int quantity = 10;
  int last = 100;
  getNotesData() async {
    print(quantity);
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
            isEqualTo: 'lfTxZaR19zLFuHlKZgoA',
          )
          .limit(quantity)
          .get();
      List<QueryDocumentSnapshot> documentList = queries.docs;
      notesList.clear();
      documentList.forEach((element) {
        notesList
            .add(NotesModel.fromJson(element.data() as Map<String, dynamic>));
        log('${element.data()}');
        log('${notesList.length}');
        if (quantity == 10) {
          isLoading = false;
        } else {
          isFetching = false;
        }
      });
    } catch (e) {
      log('$e');
      isError = false;
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

  removeNote() async {}
   @override
  void onInit() {
    getNotesData();
    paginate();
    super.onInit();
  }
}
