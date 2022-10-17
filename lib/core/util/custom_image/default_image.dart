// Flutter imports:
import 'package:flutter/material.dart';
import 'package:streamskit_mobile/core/util/styles/style.dart';

// Project imports:

class DefaultImage extends StatelessWidget {
  final double height;
  final double width;
  final EdgeInsetsGeometry? margin;
  final BoxShape shape;
  final BorderRadiusGeometry? borderRadius;
  final Widget? childInAvatar;
  const DefaultImage({
    Key? key,
    required this.height,
    required this.width,
    required this.margin,
    required this.shape,
    this.borderRadius,
    this.childInAvatar,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      decoration: BoxDecoration(
        shape: shape,
        borderRadius: borderRadius,
        image: DecorationImage(
          image: const AssetImage(
            launcherIcon,
          ),
          fit: shape == BoxShape.circle ? BoxFit.fitHeight : BoxFit.contain,
        ),
      ),
      alignment: Alignment.bottomRight,
      child: childInAvatar,
    );
  }
}
