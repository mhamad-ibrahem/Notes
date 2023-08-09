import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:notes/Global/Core/Constant/Colors.dart';
import 'package:notes/Local/Core/Constant/Colors.dart';

class ChatBubbleSender extends StatelessWidget {
  const ChatBubbleSender(
      {super.key,
      required this.message,
      required this.isSender,
      required this.name});
  final String message;
  final String name;
  final bool isSender;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          !isSender ? CrossAxisAlignment.start : CrossAxisAlignment.end,
      children: [
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(name,
              style: Theme.of(context)
                  .textTheme
                  .displaySmall!
                  .copyWith(color: GlobalColors.black, fontSize: 16)),
        ),
        const SizedBox(
          height: 10,
        ),
        ChatBubble(
          clipper: ChatBubbleClipper1(
              type:
                  isSender ? BubbleType.sendBubble : BubbleType.receiverBubble),
          alignment: isSender ? Alignment.topRight : Alignment.topLeft,
          // margin: const EdgeInsets.only(top: 20),
          backGroundColor: isSender ? AppColors.primaryColor : AppColors.lgrey,
          child: Container(
            padding: const EdgeInsets.all(5),
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.7,
            ),
            child: Text(
              message,
              style: isSender
                  ? Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(color: GlobalColors.white, fontSize: 16)
                  : Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(color: GlobalColors.black, fontSize: 16),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
