import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes/Global/Core/Class/HandilingData.dart';
import 'package:notes/Global/Core/Constant/Colors.dart';
import 'package:notes/Local/Core/Constant/Colors.dart';
import 'package:notes/Local/Core/Constant/Routes.dart';
import 'package:notes/Local/View/Shared/custom_cached_network_image.dart';
import 'package:notes/Local/modules/profile/controller/profile_controller_imp.dart';

import '../../../Core/Functions/url_lunch.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: GetBuilder<ProfileControllerImplement>(
        builder: (controller) => HandilingDataView(
          statusRequest: controller.statusRequest,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: CircleAvatar(
                    radius: 60,
                    backgroundColor: AppColors.primaryColor,
                    child: (controller.userModel.image == 'null' &&
                            controller.userModel.image == '')
                        ? CustomCachedNetImage(
                            imageUrl: controller.userModel.image!,
                            canReDownload: controller.canReGet)
                        : Center(
                            child: Text(
                              controller.userModel.name[0].toUpperCase(),
                              style: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .copyWith(
                                      color: GlobalColors.white, fontSize: 35),
                            ),
                          ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  controller.userModel.name,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  controller.userModel.email,
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall
                      ?.copyWith(fontSize: 14),
                ),
                const SizedBox(
                  height: 30,
                ),
                ListTile(
                  title: Text(
                    'Help Center',
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(fontSize: 15),
                  ),
                  onTap: () {
                    Get.toNamed(AppRoute.helpCenter);
                  },
                  trailing: const Icon(Icons.arrow_forward,
                      color: AppColors.primaryColor),
                ),
                ListTile(
                  title: Text(
                    'About us',
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(fontSize: 15),
                  ),
                  onTap: () {
                    launchURL('//mhamad-ibrahem.github.io/', 'https');
                  },
                  trailing: const Icon(Icons.arrow_forward,
                      color: AppColors.primaryColor),
                ),
                ListTile(
                  title: Text(
                    'Log out',
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(fontSize: 15),
                  ),
                  onTap: () {
                    controller.logOut();
                  },
                  trailing: const Icon(Icons.arrow_forward,
                      color: AppColors.primaryColor),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
