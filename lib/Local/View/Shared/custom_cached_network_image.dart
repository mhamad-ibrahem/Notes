import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:notes/Global/Core/Constant/Colors.dart';
import '../../Core/Constant/Colors.dart';
import '../../modules/home/view/custom/shimmer_loading.dart';

class CustomCachedNetImage extends StatelessWidget {
  const CustomCachedNetImage({
    super.key,
    required this.imageUrl,
    this.height,
    this.width,
    required this.canReDownload,
    this.reDownload,
    this.fit,
  });
  final String imageUrl;
  final double? height;
  final double? width;
  final bool canReDownload;
  final void Function()? reDownload;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    //Change Getx Controller Here
    return CachedNetworkImage(
        imageUrl: imageUrl,
        fit: fit ?? BoxFit.cover,
        placeholder: (context, url) => ShimmerWidget.rectangle(
              hight: height ?? 150,
              width: width ?? 100,
              isHorizontalRadius: true,
            ),
        //Can Re Get is Getx Controller Variable
        errorWidget: (context, url, error) => canReDownload == true
            ? Container(
                color: AppColors.grey,
                height: height ?? 150,
                width: width ?? 100,
                child: IconButton(
                    onPressed: reDownload,
                    icon: const Icon(
                      Icons.refresh,
                      size: 40,
                      color: GlobalColors.white,
                    )),
              )
            : CustomCachedNetImage(
                imageUrl: imageUrl,
                canReDownload: canReDownload,
              ));
  }
}
