import 'package:flutter/material.dart';
import 'package:notes/Local/Core/Constant/Colors.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  final double hight;
  final double width;
  final BoxShape? shapeBorder;
  final double borderRadius;
  const ShimmerWidget.rectangle({
    super.key,
    required this.hight,
    required this.width,
    this.shapeBorder = BoxShape.rectangle,
    required this.borderRadius,
  });
  const ShimmerWidget.circle({
    super.key,
    required this.hight,
    required this.width,
    this.shapeBorder = BoxShape.circle,
    required this.borderRadius,
  });
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[400]!,
      highlightColor: Colors.grey[300]!,
      child: Container(
        width: width,
        height: hight,
        decoration: BoxDecoration(
            color: AppColors.grey,
            shape: shapeBorder!,
            borderRadius: BorderRadius.circular(borderRadius)),
      ),
    );
  }
}
