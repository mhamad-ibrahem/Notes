import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes/Global/Core/Class/HandilingData.dart';
import 'package:notes/Global/Core/Constant/Size.dart';
import 'package:notes/Global/Core/Functions/Validation.dart';
import 'package:notes/Local/Core/Constant/Colors.dart';
import 'package:notes/Local/View/Widget/CustomButton.dart';
import 'package:notes/Local/View/Widget/CustomExitButton.dart';
import 'package:notes/Local/View/Widget/CustomTextFormField.dart';
import 'package:notes/Local/View/Widget/custom_app_bar.dart';

import '../controller/add_notes_controller.dart';
import 'custom/choose_image_bottom_sheet.dart';

class AddNotesPage extends StatelessWidget {
  AddNotesPage({super.key});
  final AddNotesController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: customAppBar(context: context, title: 'Add Note', isBack: true),
        body: GetBuilder<AddNotesController>(
          builder: (controller) => HandilingDataRequest(
            statusRequest: controller.statusRequest,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Expanded(
                      child: SingleChildScrollView(
                    child: Form(
                      key: controller.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('File field to add note',
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium
                                  ?.copyWith(fontSize: 18)),
                          const SizedBox(
                            height: 6,
                          ),
                          Text(
                            "Don't forget to choose a image",
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          CustomTextFormField(
                              icon: Icons.title_rounded,
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
                              isMultiLine: true,
                              validator: (val) {
                                return validation(val!, 1, 400, '');
                              },
                              textEditingController: controller.subTitle,
                              suffixIcon: null),
                          const SizedBox(
                            height: 20,
                          ),
                          if (controller.image != null)
                            Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Container(
                                  alignment: Alignment.topRight,
                                  height: 150,
                                  width: 125,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                          color: AppColors.primaryColor,
                                          width: 2),
                                      image: DecorationImage(
                                          image: FileImage(controller.image!),
                                          fit: BoxFit.cover)),
                                ),
                                Positioned(
                                  right: -8,
                                  top: -8,
                                  child: CustomExitButton(
                                      radius: 15,
                                      onTap: () {
                                        controller.removeImage();
                                      }),
                                ),
                              ],
                            )
                        ],
                      ),
                    ),
                  )),
                  const SizedBox(
                    height: 20,
                  ),
                  if (controller.image == null)
                    CustomButton(
                        buttonBody: 'Upload Image',
                        onTap: () {
                          openEditBottomSheet(context, () {
                            controller.uploadGalleryImage();
                          }, () {
                            controller.uploadCameraImage();
                          });
                        },
                        buttonWidth: AppSize.screenWidth * 0.7),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                      buttonBody: 'Add Note',
                      onTap: () {
                        controller.addNotes();
                      },
                      buttonWidth: AppSize.screenWidth * 0.7)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
