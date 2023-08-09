import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes/Local/modules/chat/model/chat_message_model.dart';
import 'package:notes/Local/modules/profile/controller/profile_controller_imp.dart';

import '../../../../Global/Core/Class/StatusRequest.dart';
import '../data/static_messages.dart';

abstract class ChatDetailsController extends GetxController {
  bool isKeyboardOpen = false;
  bool isEmojiVisible = false;
  TextEditingController message = TextEditingController();
  FocusNode focusNode = FocusNode();
  late StreamSubscription<bool> keyboardSubscription;
  List<ChatMessageModel> chatList = chats;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference chatsCollection =
      FirebaseFirestore.instance.collection('chats');
  StatusRequest statusRequest = StatusRequest.none;
  ProfileControllerImplement profileControllerImplement = Get.find();
  late ScrollController scrollController;

  //functions
  handelKeyBoardState();

  onCloseApp();

  selectEmoji(String emoji);

  showEmoji();
  sendMessage();
}
