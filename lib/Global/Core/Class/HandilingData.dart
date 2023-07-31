
import 'package:flutter/material.dart';
import '../../../Local/Core/Constant/Colors.dart';
import 'StatusRequest.dart';

class HandilingDataView extends StatelessWidget {
  const HandilingDataView(
      {super.key, required this.statusRequest, required this.child});
  final StatusRequest statusRequest;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? const Center(
            child: CircularProgressIndicator(
            color: AppColors.primaryColor,
          ))
        : statusRequest == StatusRequest.faliure
            ? const Center(child: Text("Faliur"))
            : statusRequest == StatusRequest.offlineFaliure
                ? const Center(child: Text("Offline"))
                : statusRequest == StatusRequest.serverFaliure
                    ? const Center(child: Text("Faliur"))
                    : child;
  }
}

class HandilingDataRequest extends StatelessWidget {
  const HandilingDataRequest(
      {super.key, required this.statusRequest, required this.child});
  final StatusRequest statusRequest;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircularProgressIndicator(
                color: AppColors.primaryColor,
              ),
            ],
          ))
        : child;
  }
}
