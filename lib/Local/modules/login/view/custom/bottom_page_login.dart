import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes/Local/Core/Constant/Images.dart';
import '../../../../../Global/Core/Constant/Size.dart';
import '../../../../Core/Constant/Colors.dart';
import '../../../../Core/Constant/TextStyles.dart';
import '../../../../View/Widget/CustomButton.dart';
import '../../controller/login_controller.dart';

class BottomPageLogin extends StatelessWidget {
  BottomPageLogin({super.key});
  final LoginController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomButton(
            buttonBody:
                controller.loginMythod == 'Email' ? 'Login' : 'Login With Otp',
            onTap: () {
              print(controller.loginMythod);
              controller.loginMythod == 'Email'
                  ? controller.login()
                  : controller.otpLogin();
            },
            buttonWidth: AppSize.screenWidth),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Don't have an account",
              style: Theme.of(context)
                  .textTheme
                  .displaySmall!
                  .copyWith(color: AppColors.deepGrey),
            ),
            TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Text(
                  'Register',
                  style: primaryTextStyle(true).copyWith(fontSize: 16),
                )),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        GestureDetector(
          onTap: () async {
            await controller.loginWithGoogle();
          },
          child: SizedBox(
            height: 30,
            child: Image.asset(AppImages.googleIcon),
          ),
        )
      ],
    );
  }
}
