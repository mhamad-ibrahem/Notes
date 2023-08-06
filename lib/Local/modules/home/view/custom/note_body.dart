import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes/Local/modules/home/controller/home_controller.dart';
import 'package:notes/Local/modules/home/model/notes_model.dart';
import '../../../../Core/Constant/Colors.dart';
import '../../../../View/Shared/custom_cached_network_image.dart';
import '../../../../View/Shared/loading_points.dart';

class NoteBody extends StatelessWidget {
  const NoteBody({
    super.key,
    this.onTap,
    required this.model,
    this.onDelete,
  });
  final void Function()? onTap;
  final void Function()? onDelete;
  final NotesModel model;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => GestureDetector(
          onTap: onTap,
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 5,
            child: Row(
              children: [
                Container(
                  height: 110,
                  width: 120,
                  decoration: const BoxDecoration(
                    borderRadius:
                        BorderRadius.horizontal(left: Radius.circular(12)),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.horizontal(
                        left: Radius.circular(12)),
                    child: CustomCachedNetImage(
                        imageUrl: model.image,
                        reDownload: () {
                          controller.reGetImage();
                        },
                        canReDownload: controller.canReGet),
                  ),
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        model.title,
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium
                            ?.copyWith(fontSize: 16),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        model.subTitle,
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            model.date,
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                          model.isDeleteLoading
                              ? const LoadingPoint(
                                  color: AppColors.primaryColor,
                                )
                              : GestureDetector(
                                  onTap: onDelete,
                                  child: const Icon(
                                    Icons.delete_outline_outlined,
                                    color: AppColors.primaryColor,
                                  ),
                                )
                        ],
                      )
                    ],
                  ),
                ))
              ],
            ),
          )),
    );
  }
}
