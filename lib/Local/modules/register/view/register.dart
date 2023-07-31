import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes/Global/Core/Class/HandilingData.dart';
import 'package:notes/Local/modules/register/controller/register_controller.dart';
import 'custom/bottom_register.dart';
import 'custom/register_form.dart';

class Register extends StatelessWidget {
  Register({super.key});
  final RegisterController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: GetBuilder<RegisterController>(
            builder: (controller) => HandilingDataRequest(
              statusRequest: controller.statusRequest,
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Dear user',
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Craet account to use this app',
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          RegisterForm(),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                  BottomRegister(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
