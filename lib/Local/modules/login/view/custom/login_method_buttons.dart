import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes/Global/Core/Constant/Size.dart';
import 'package:notes/Local/View/Widget/CustomButton.dart';
import 'package:notes/Local/modules/login/controller/login_controller.dart';

class LoginMethodsButton extends StatelessWidget {
  LoginMethodsButton({super.key});
  final LoginController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomButton(
                buttonBody: 'With Email',
                isSelected: controller.loginMethod == 'Email' ? false : true,
                hight: 45,
                onTap: () {
                  controller.changeLoginMethod('Email');
                },
                buttonWidth: AppSize.screenWidth * 0.4),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomButton(
                buttonBody: 'With Number',
                hight: 45,
                isSelected: controller.loginMethod == 'Number' ? false : true,
                onTap: () {
                  controller.changeLoginMethod('Number');
                },
                buttonWidth: AppSize.screenWidth * 0.4),
          ),
        ),
      ],
    );
  }
}
