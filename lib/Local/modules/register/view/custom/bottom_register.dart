import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes/Local/Core/Constant/Colors.dart';
import 'package:notes/Local/Core/Constant/Routes.dart';

import '../../../../../Global/Core/Constant/Size.dart';
import '../../../../Core/Constant/TextStyles.dart';
import '../../../../View/Widget/CustomButton.dart';
import '../../controller/register_controller.dart';

class BottomRegister extends StatelessWidget {
  BottomRegister({super.key});
  final RegisterController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomButton(
            buttonBody: 'Register',
            onTap: () {
              controller.register();
            },
            buttonWidth: AppSize.screenWidth),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'All ready have an account',
              style: Theme.of(context)
                  .textTheme
                  .displaySmall!
                  .copyWith(color: AppColors.deepGrey),
            ),
            TextButton(
                onPressed: () {
                  Get.toNamed(AppRoute.login);
                },
                child: Text(
                  'Login',
                  style: primaryTextStyle(true).copyWith(fontSize: 16),
                )),
          ],
        )
      ],
    );
  }
}
