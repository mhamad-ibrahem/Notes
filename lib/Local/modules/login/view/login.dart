import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes/Global/Core/Class/HandilingData.dart';
import '../controller/login_controller.dart';
import 'custom/bottom_page_login.dart';
import 'custom/login_form.dart';
import 'custom/login_method_buttons.dart';

class Login extends StatelessWidget {
  Login({super.key});
  final LoginController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: GetBuilder<LoginController>(
            builder: (controller) => HandilingDataRequest(
              statusRequest: controller.statusRequest,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Wellcom Back',
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'login to continue',
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          LoginMethodsButton(),
                          const SizedBox(
                            height: 20,
                          ),
                          LoginForm()
                        ],
                      ),
                    ),
                  ),
                  BottomPageLogin(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
