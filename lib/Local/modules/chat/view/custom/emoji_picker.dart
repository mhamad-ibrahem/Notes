import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes/Global/Core/Constant/Colors.dart';
import 'package:notes/Global/Core/Constant/Size.dart';
import 'package:notes/Local/Core/Constant/Colors.dart';

import '../../controller/chat_controller.dart';

class EmojiPickerView extends StatelessWidget {
  EmojiPickerView({super.key});
  final ChatDetsilsController chatDetsilsController = Get.find();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatDetsilsController>(
      builder: (chatDetsilsController) => SizedBox(
        height: AppSize.screenHight * 0.3,
        width: double.infinity,
        child: EmojiPicker(
          onEmojiSelected: (category, emoji) {
            // chatDetsilsController.selectImoji(emoji.emoji);
          },
          textEditingController: chatDetsilsController.chatText,
          config: const Config(
            columns:
                7, // Issue: https://github.com/flutter/flutter/issues/28894
            verticalSpacing: 0,
            horizontalSpacing: 0,
            gridPadding: EdgeInsets.zero,
            initCategory: Category.RECENT,
            bgColor: GlobalColors.white,
            indicatorColor: AppColors.primaryColor,
            iconColor: Colors.grey,
            iconColorSelected: AppColors.primaryColor,
            backspaceColor: AppColors.primaryColor,
            skinToneDialogBgColor: Colors.white,
            skinToneIndicatorColor: Colors.grey,
            enableSkinTones: true,
            recentTabBehavior: RecentTabBehavior.RECENT,
            recentsLimit: 28,
            noRecents: Text(
              'No Recents',
              style: TextStyle(fontSize: 20, color: Colors.black26),
              textAlign: TextAlign.center,
            ), // Needs to be const Widget
            loadingIndicator: SizedBox.shrink(), // Needs to be const Widget
            tabIndicatorAnimDuration: kTabScrollDuration,
            categoryIcons: CategoryIcons(),
            buttonMode: ButtonMode.MATERIAL,
          ),
        ),
      ),
    );
  }
}
