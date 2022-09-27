import 'package:flutter/material.dart';
import 'package:streamskit_mobile/core/util/shimmer/fade_shimmer.dart';
import 'package:streamskit_mobile/core/util/themes/app_color.dart';

class PlaceHolderImage extends StatelessWidget {
  final double height;
  final double width;
  final BoxShape shape;
  const PlaceHolderImage({
    Key? key,
    required this.height,
    required this.width,
    required this.shape,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return shape == BoxShape.circle
        ? FadeShimmer.round(
            size: height,
            highlightColor: colorPurple,
            baseColor: mCM,
          )
        : FadeShimmer(
            width: width,
            height: height,
            highlightColor: colorPurple,
            baseColor: mCM,
          );
  }
}
