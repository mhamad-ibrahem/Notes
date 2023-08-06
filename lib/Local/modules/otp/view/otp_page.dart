import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes/Global/Core/Class/HandilingData.dart';
import 'package:notes/Global/Core/Constant/Size.dart';
import 'package:notes/Local/Core/Constant/Colors.dart';
import 'package:notes/Local/modules/otp/controller/otp_controller.dart';

import '../../../View/Widget/OtpTextField.dart';

class OtpPage extends StatelessWidget {
  OtpPage({super.key});
  final OtpController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<OtpController>(
        builder: (controller) => HandilingDataRequest(
            statusRequest: controller.statusRequest,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: AppSize.screenHight * 0.35,
                    ),
                    Text(
                      'We send an otp number to your phone number please enter it to login ',
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall
                          ?.copyWith(color: AppColors.deepGrey, fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    OtpInput(
                      otpFunction: (val) {
                        controller.login(val);
                      },
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
