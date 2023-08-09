import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes/Global/Core/Class/app_toast.dart';
import 'package:notes/Global/Core/Services/services.dart';
import 'package:notes/Local/Core/Constant/Colors.dart';
import 'package:notes/Local/View/Shared/loading_points.dart';
import 'package:notes/Local/View/Widget/CustomTextFormField.dart';
import '../../../View/Shared/chat_bubble.dart';
import '../controller/chat_controller_imp.dart';
import 'custom/emoji_picker.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key});
  final ChatControllerImp chatDetailsController = Get.find();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return chatDetailsController.onCloseApp();
      },
      child: Scaffold(
        body: GetBuilder<ChatControllerImp>(
          builder: (chatDetailsController) => Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: StreamBuilder(
                    stream: chatDetailsController.chatsCollection
                        .orderBy('date')
                        .snapshots(),
                    builder: ((context, snapshot) {
                      if (snapshot.hasError) {
                        AppToasts.errorToast('Error');
                      }
                      if (snapshot.hasData) {
                        chatDetailsController.scrollController =
                            ScrollController(
                                initialScrollOffset:
                                    snapshot.data!.docs.length * 1000.7);
                        return ListView.builder(
                            controller: chatDetailsController.scrollController,
                            shrinkWrap: true,
                            padding: const EdgeInsets.symmetric(horizontal: 3),
                            // physics: const NeverScrollableScrollPhysics(),
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) => ChatBubbleSender(
                                  isSender: snapshot.data!.docs[index]
                                              ['user_id'] ==
                                          Services.userId
                                      ? true
                                      : false,
                                  message: snapshot.data!.docs[index]
                                      ['message'],
                                  name: snapshot.data!.docs[index]['user_name'],
                                ));
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        const LoadingPoint(
                          color: AppColors.primaryColor,
                        );
                      }
                      return const LoadingPoint(
                        color: AppColors.primaryColor,
                      );
                    })),
              ),
              CustomTextFormField(
                  focusNode: chatDetailsController.focusNode,
                  icon: chatDetailsController.isEmojiVisible == false
                      ? Icons.emoji_emotions_outlined
                      : Icons.keyboard_alt_outlined,
                  label: '',
                  hint: 'Type message',
                  obscure: false,
                  textEditingController: chatDetailsController.message,
                  isChat: true,
                  onTap: () {
                    chatDetailsController.handelKeyBoardState();
                    // chatDetailsController.focusNode.requestFocus();
                  },
                  suffixIcon: IconButton(
                      onPressed: () {
                        chatDetailsController.sendMessage();
                      },
                      icon: const Icon(
                        Icons.send,
                        color: AppColors.primaryColor,
                      ))),
              const SizedBox(
                height: 20,
              ),
              Offstage(
                offstage: !chatDetailsController.isEmojiVisible,
                child: EmojiPickerView(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
