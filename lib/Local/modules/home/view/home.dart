import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes/Local/Core/Constant/Colors.dart';
import 'package:notes/Local/Core/Constant/Routes.dart';
import '../../../../Global/Core/Class/StatusRequest.dart';
import '../controller/home_controller.dart';
import 'custom/note_body.dart';
import 'custom/shimmer_loading.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final HomeController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoute.addNotes);
        },
        backgroundColor: AppColors.primaryColor,
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GetBuilder<HomeController>(
          builder: (controller) => controller.isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ))
              : Column(
                  children: [
                    Expanded(
                        child: ListView.builder(
                      controller: controller.scrollController,
                      itemCount:
                          controller.statusRequest == StatusRequest.loading
                              ? 4
                              : controller.notesList.length,
                      itemBuilder: (context, index) =>
                          controller.statusRequest == StatusRequest.loading
                              ? const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 5),
                                  child: ShimmerWidget.rectangle(
                                      hight: 110,
                                      width: double.infinity,
                                      borderRadius: 12),
                                )
                              : NoteBody(
                                  model: controller.notesList[index],
                                  onTap: () {},
                                ),
                    )),
                    if (controller.isFetching)
                      const Center(
                          child: SizedBox(
                        height: 40,
                        child: CircularProgressIndicator(
                          color: AppColors.primaryColor,
                        ),
                      ))
                  ],
                ),
        ),
      ),
    );
  }
}
