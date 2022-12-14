import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sata_widgets/widgets/shimmer.dart';

import '../sata_widgets.dart';

class CachedNImage {
  static Widget expand(String? imgUrl,
          {IconData? errorIcon,
          Color? errorBgColor,
          Color? errorIconColor,
          BoxFit? fit}) =>
      SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: _CachedNImage(
          imgUrl,
          errorIcon: errorIcon,
          errorBgColor: errorBgColor,
          errorIconColor: errorIconColor,
          fit: fit,
        ),
      );
  static Widget imageSize(String? imgUrl,
          {IconData? errorIcon,
          Color? errorBgColor,
          Color? errorIconColor,
          BoxFit? fit}) =>
      _CachedNImage(
        imgUrl,
        errorIcon: errorIcon,
        errorBgColor: errorBgColor,
        errorIconColor: errorIconColor,
        fit: fit,
      );
}

class _CachedNImage extends StatelessWidget {
  const _CachedNImage(this.imgUrl,
      {Key? key,
      this.errorIcon,
      this.errorBgColor,
      this.errorIconColor,
      this.fit})
      : super(key: key);
  final String? imgUrl;
  final Color? errorBgColor;
  final Color? errorIconColor;
  final IconData? errorIcon;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.0),
      child: imgUrl != null
          ? CachedNetworkImage(
              imageUrl: imgUrl!,
              placeholder: (context, url) => SwShimmer(
                  child: Container(
                color: Colors.white,
              )),
              fit: fit ?? BoxFit.cover,
              errorWidget: (context, url, error) => Container(
                width: double.infinity,
                color: errorBgColor ?? Colors.grey.shade400,
                child: Center(
                  child: Icon(
                    errorIcon ?? Icons.error_outline_rounded,
                    color: errorIconColor ?? HexColor("#818C99"),
                  ),
                ),
              ),
            )
          : Container(
              width: double.infinity,
              color: errorBgColor ?? Colors.grey.shade400,
              child: Center(
                child: Icon(
                  errorIcon ?? Icons.error_outline_rounded,
                  color: errorIconColor ?? HexColor("#818C99"),
                ),
              ),
            ),
    );
  }
}
