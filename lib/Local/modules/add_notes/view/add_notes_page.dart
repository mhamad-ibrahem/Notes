import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes/Global/Core/Constant/Size.dart';
import 'package:notes/Local/View/Widget/CustomButton.dart';
import 'package:notes/Local/View/Widget/CustomTextFormField.dart';

import '../controller/add_notes_controller.dart';

class AddNotesPage extends StatelessWidget {
  AddNotesPage({super.key});
  final AddNotesController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: GetBuilder<AddNotesController>(
            builder: (controller) => Column(
              children: [
                Expanded(
                    child: SingleChildScrollView(
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
                        "Don't forgit to choose a image",
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
                          textEditingController: controller.title,
                          suffixIcon: null),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextFormField(
                          icon: Icons.description_rounded,
                          label: 'Description',
                          hint: 'Add note description',
                          obscure: false,
                          textEditingController: controller.subTitle,
                          suffixIcon: null),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                )),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                    buttonBody: 'Upload Image',
                    onTap: () {},
                    buttonWidth: AppSize.screenWidth * 0.7),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                    buttonBody: 'Add Note',
                    isLoading: controller.loadinButton,
                    onTap: () {
                      controller.addNotes();
                    },
                    buttonWidth: AppSize.screenWidth * 0.7)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
