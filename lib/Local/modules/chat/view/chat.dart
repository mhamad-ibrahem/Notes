import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes/Local/View/Widget/CustomTextFormField.dart';
import 'package:notes/Local/modules/chat/controller/chat_controller.dart';

import 'custom/emoji_picker.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key});
  final ChatDetsilsController chatDetsilsController = Get.find();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return chatDetsilsController.onCloseApp();
      },
      child: Scaffold(
        body: GetBuilder<ChatDetsilsController>(
          builder: (chatDetsilsController) => Column(
            children: [
              Expanded(
                child: Column(
                  children: [],
                ),
              ),
              CustomTextFormField(
                  focusNode: chatDetsilsController.focusNode,
                  icon: chatDetsilsController.isEmojiVisable == false
                      ? Icons.emoji_emotions_outlined
                      : Icons.keyboard_alt_outlined,
                  label: '',
                  hint: 'Type message',
                  obscure: false,
                  textEditingController: chatDetsilsController.chatText,
                  isChat: true,
                  onTap: () {
                    chatDetsilsController.handelKeyBordState();
                    // chatDetsilsController.focusNode.requestFocus();
                  },
                  suffixIcon: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.send))),
              const SizedBox(
                height: 20,
              ),
              Offstage(
                offstage: !chatDetsilsController.isEmojiVisable,
                child: EmojiPickerView(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
