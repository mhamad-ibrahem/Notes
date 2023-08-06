import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes/Global/Core/Constant/Colors.dart';

import '../../../../Core/Constant/Colors.dart';

openEditBottomSheet(BuildContext context, void Function()? fromGallery,
    void Function()? fromCamera) {
  Get.bottomSheet(
    Container(
      padding: const EdgeInsets.all(20),
      height: 180,
      decoration: const BoxDecoration(
          color: GlobalColors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
      child: Column(
        children: [
          Text(
            "Choose Image",
            style:
                Theme.of(context).textTheme.headline1!.copyWith(fontSize: 17),
          ),
          const SizedBox(
            height: 20,
          ),
          TextButton(
              onPressed: fromGallery,
              child: Row(
                children: [
                  const Icon(
                    Icons.image,
                    color: AppColors.primaryColor,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "From Gallery",
                    style: Theme.of(context)
                        .textTheme
                        .headline2!
                        .copyWith(color: AppColors.primaryColor),
                  ),
                ],
              )),
          TextButton(
              onPressed: fromCamera,
              child: Row(
                children: [
                  const Icon(
                    Icons.camera_alt,
                    color: AppColors.primaryColor,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "From Camera",
                    style: Theme.of(context)
                        .textTheme
                        .headline2!
                        .copyWith(color: AppColors.primaryColor),
                  ),
                ],
              ))
        ],
      ),
    ),
  );
}
