import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:notes/Global/Core/Constant/Colors.dart';

class LoadingPoint extends StatelessWidget {
  final Color? color;
  final double? size;
  const LoadingPoint({super.key, this.color, this.size});

  @override
  Widget build(BuildContext context) {
    return SpinKitThreeBounce(
      color: color ?? GlobalColors.white,
      size: size ?? 12,
    );
  }
}
