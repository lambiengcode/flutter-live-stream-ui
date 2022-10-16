// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:streamskit_mobile/core/app/colors/app_color.dart';
import 'package:streamskit_mobile/core/util/shimmer/fade_shimmer.dart';
import 'package:streamskit_mobile/core/util/themes/app_color.dart';

class PlaceHolderImage extends StatelessWidget {
  final double height;
  final double width;
  final BoxShape shape;
  final BorderRadiusGeometry? borderRadius;
  const PlaceHolderImage({
    Key? key,
    required this.height,
    required this.width,
    required this.shape,
    required this.borderRadius,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return shape == BoxShape.circle
        ? FadeShimmer.round(
            size: height,
            highlightColor: colorPink,
            baseColor: mCM,
          )
        : FadeShimmer(
            width: width,
            height: height,
            highlightColor: colorPink,
            baseColor: mCM,
            borderRadius: borderRadius,
          );
  }
}
