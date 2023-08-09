import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:notes/Local/modules/chat/model/chat_message_model.dart';

import '../data/static_messages.dart';

class ChatDetsilsController extends GetxController {
  bool isKyboardOpen = false;
  bool isEmojiVisable = false;
  TextEditingController chatText = TextEditingController();
  FocusNode focusNode = FocusNode();
  late StreamSubscription<bool> keyboardSubscription;
  List<ChatMessageModel> chatList = chats;
  // late ScrollController scrollController = ScrollController();
  @override
  void dispose() {
    keyboardSubscription.cancel();
    focusNode.dispose();
    chatText.dispose();
    super.dispose();
  }

  @override
  void onInit() {
    // scrollController = ScrollController(
    //     initialScrollOffset: scrollController.position.maxScrollExtent);
    keyboardSubscription =
        KeyboardVisibilityController().onChange.listen((bool visible) {
      print('Keyboard visibility update. Is visible: $visible');
      isKyboardOpen = visible;
      update();
      if (isKyboardOpen && isEmojiVisable) {
        isEmojiVisable = false;
        update();
      }
    });
    super.onInit();
  }

  handelKeyBordState() async {
    if (isEmojiVisable) {
      await Future.delayed(const Duration(milliseconds: 100), () {
        isEmojiVisable = !isEmojiVisable;
        focusNode.requestFocus();
      });
      update();
    } else if (isKyboardOpen && isEmojiVisable == false) {
      await SystemChannels.textInput.invokeMethod('TextInput.hide');
      await Future.delayed(const Duration(milliseconds: 100), () {
        focusNode.unfocus();
        isEmojiVisable = !isEmojiVisable;
        update();
      });
    } else if (isKyboardOpen == false && isEmojiVisable == false) {
      isEmojiVisable = !isEmojiVisable;
      update();
    }
  }

  Future<bool> onCloseApp() {
    if (isEmojiVisable) {
      showEmoji();
    } else {
      Get.back();
    }
    return Future.value(false);
  }

  selectImoji(String emoji) {
    chatText.text = chatText.text + emoji;
    update();
  }

  showEmoji() {
    log('isKyboardOpen4 $isKyboardOpen');
    update();
    if (isKyboardOpen) {
      focusNode.unfocus();
    }
    log('isEmojiVisable4 $isEmojiVisable');
    isEmojiVisable = !isEmojiVisable;
    log('isEmojiVisable5 $isEmojiVisable');
    log('isKyboardOpen5 $isKyboardOpen');
    update();
  }
}
