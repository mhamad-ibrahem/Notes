import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes/Global/Core/Class/HandilingData.dart';
import 'package:notes/Global/Core/Constant/Colors.dart';
import 'package:notes/Global/Core/Constant/Size.dart';
import 'package:notes/Local/View/Shared/custom_cached_network_image.dart';
import 'package:notes/Local/View/Widget/CustomBackButton.dart';
import 'package:notes/Local/View/Widget/CustomButton.dart';
import 'package:notes/Local/modules/edit_note/controller/edit_note_controller.dart';

import '../../../../Global/Core/Functions/Validation.dart';
import '../../../View/Widget/CustomTextFormField.dart';
import '../../add_notes/view/custom/choose_image_bottom_sheet.dart';

class EditNotePage extends StatelessWidget {
  const EditNotePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GetBuilder<EditNoteController>(
          builder: (controller) {
            return HandilingDataRequest(
              statusRequest: controller.statusRequest,
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                        child: Column(children: [
                      Stack(
                        children: [
                          SizedBox(
                            height: 300,
                            width: double.infinity,
                            child: controller.image == null
                                ? CustomCachedNetImage(
                                    imageUrl: controller.notesModel.image,
                                    canReDownload: controller.canReGet,
                                    reDownload: () {
                                      controller.reGetImage();
                                    },
                                    width: double.infinity,
                                    height: 300)
                                : Image.file(controller.image!,
                                    fit: BoxFit.cover),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 12),
                            child: CustomBackButton(
                                color: GlobalColors.white, size: 35),
                          ),
                          if (controller.isEnableEditing)
                            Positioned(
                              bottom: 20,
                              right: 20,
                              child: IconButton(
                                  onPressed: () {
                                    openEditBottomSheet(context, () {
                                      controller.uploadGalleryImage();
                                    }, () {
                                      controller.uploadCameraImage();
                                    });
                                  },
                                  icon: const Icon(
                                    Icons.upload,
                                    color: GlobalColors.white,
                                    size: 45,
                                  )),
                            )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Form(
                          key: controller.formKey,
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              CustomTextFormField(
                                  icon: Icons.title_rounded,
                                  isEnable: controller.isEnableEditing,
                                  label: 'Title',
                                  hint: 'Add note title',
                                  obscure: false,
                                  validator: (val) {
                                    return validation(val!, 1, 50, '');
                                  },
                                  textEditingController: controller.title,
                                  suffixIcon: null),
                              const SizedBox(
                                height: 20,
                              ),
                              CustomTextFormField(
                                  label: 'Description',
                                  hint: 'Add note description ........',
                                  obscure: false,
                                  isEnable: controller.isEnableEditing,
                                  isMultiLine: true,
                                  validator: (val) {
                                    return validation(val!, 1, 400, '');
                                  },
                                  textEditingController: controller.subTitle,
                                  suffixIcon: null),
                            ],
                          ),
                        ),
                      )
                    ])),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: CustomButton(
                        buttonBody: controller.isEnableEditing == false
                            ? 'Enable Editing'
                            : 'Save',
                        onTap: () {
                          controller.isEnableEditing == false
                              ? controller.enableEditing()
                              : controller.image != null
                                  ? controller.updateNotes()
                                  : controller.updateDataWithOutImage();
                        },
                        buttonWidth: AppSize.screenWidth * 0.4),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
