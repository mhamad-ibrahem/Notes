import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes/Global/Core/Functions/Validation.dart';

import '../../../../View/Widget/CustomTextFormField.dart';
import '../../controller/register_controller.dart';

class RegisterForm extends StatelessWidget {
  RegisterForm({super.key});
  final RegisterController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextFormField(
              icon: Icons.person,
              label: 'Name',
              hint: 'Add your name',
              obscure: false,
              textEditingController: controller.name,
              validator: (val) {
                return validation(val!, 0, 500, '');
              },
              suffixIcon: null),
          const SizedBox(
            height: 20,
          ),
          CustomTextFormField(
              icon: Icons.email_outlined,
              label: 'Email',
              hint: 'Add your email',
              obscure: false,
              textEditingController: controller.email,
              validator: (val) {
                return validation(val!, 0, 500, 'email');
              },
              suffixIcon: null),
          const SizedBox(
            height: 20,
          ),
          CustomTextFormField(
              icon: Icons.lock,
              label: 'Phone Number',
              hint: 'Add your phone number',
              obscure: false,
              textEditingController: controller.number,
              validator: (val) {
                return validation(val!, 9, 9, 'Number');
              },
              suffixIcon: null),
          const SizedBox(
            height: 20,
          ),
          CustomTextFormField(
              icon: Icons.lock,
              label: 'Passowrd',
              hint: 'Add your password',
              obscure: true,
              textEditingController: controller.password,
              validator: (val) {
                return validation(val!, 8, 500, '');
              },
              suffixIcon: null),
        ],
      ),
    );
  }
}
