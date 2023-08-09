import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:notes/Global/Core/Services/services.dart';
import 'package:notes/Local/modules/chat/controller/chat_controller.dart';

class ChatControllerImp extends ChatDetailsController {
  @override
  void dispose() {
    keyboardSubscription.cancel();
    focusNode.dispose();
    message.dispose();
    scrollController.dispose();
    super.dispose();
  }

  @override
  void onInit() {
    scrollController = ScrollController();

    // scrollToLastMessage();
    keyboardSubscription =
        KeyboardVisibilityController().onChange.listen((bool visible) {
      print('Keyboard visibility update. Is visible: $visible');
      isKeyboardOpen = visible;
      update();
      if (isKeyboardOpen && isEmojiVisible) {
        isEmojiVisible = false;
        update();
      }
    });

    super.onInit();
  }

  void scrollToLastMessage() {
    if (scrollController.hasClients) {
      log("${scrollController.position.maxScrollExtent}");
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
    update();
  }

  @override
  handelKeyBoardState() async {
    if (isEmojiVisible) {
      await Future.delayed(const Duration(milliseconds: 100), () {
        isEmojiVisible = !isEmojiVisible;
        focusNode.requestFocus();
      });
      update();
    } else if (isKeyboardOpen && isEmojiVisible == false) {
      await SystemChannels.textInput.invokeMethod('TextInput.hide');
      await Future.delayed(const Duration(milliseconds: 100), () {
        focusNode.unfocus();
        isEmojiVisible = !isEmojiVisible;
        update();
      });
    } else if (isKeyboardOpen == false && isEmojiVisible == false) {
      isEmojiVisible = !isEmojiVisible;
      update();
    }
  }

  @override
  Future<bool> onCloseApp() {
    if (isEmojiVisible) {
      showEmoji();
    } else {
      Get.back();
    }
    return Future.value(false);
  }

  @override
  selectEmoji(String emoji) {
    message.text = message.text + emoji;
    update();
  }

  @override
  showEmoji() {
    update();
    if (isKeyboardOpen) {
      focusNode.unfocus();
    }
    isEmojiVisible = !isEmojiVisible;
    update();
  }

  @override
  sendMessage() async {
    await chatsCollection.add({
      "date": FieldValue.serverTimestamp(),
      "message": message.text,
      "user_id": Services.userId,
      "user_name": profileControllerImplement.userModel.name,
    }).then((value) {
      message.clear();
      scrollToLastMessage();
      // scrollController.animateTo(scrollController.position.maxScrollExtent,
      //     duration: const Duration(milliseconds: 30), curve: Curves.easeInOut);
    });
  }
}
