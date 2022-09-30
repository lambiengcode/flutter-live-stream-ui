import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:streamskit_mobile/core/app/constants.dart';
import 'package:streamskit_mobile/core/util/custom_image/default_image.dart';
import 'package:streamskit_mobile/core/util/custom_image/place_holder_image.dart';

class CustomNetworkImage extends StatelessWidget {
  final String? urlToImage;
  final double? height;
  final double? width;
  final BoxShape shape;
  final BoxFit? fit;
  final EdgeInsetsGeometry? margin;
  final BorderRadiusGeometry? borderRadius;
  final Widget? placeholderWidget;
  final ColorFilter? colorFilter;
  final Widget? childInAvatar;
  // ignore: use_key_in_widget_constructors
  const CustomNetworkImage({
    Key? key,
    required this.urlToImage,
    this.height,
    this.width,
    this.shape = BoxShape.circle,
    this.fit = BoxFit.cover,
    this.margin,
    this.borderRadius,
    this.placeholderWidget,
    this.colorFilter,
    this.childInAvatar,
  }) : assert(height != null || width != null);
  @override
  Widget build(BuildContext context) {
    return urlToImage == null
        ? placeholderWidget ??
            DefaultImage(
              height: height ?? width!,
              width: height ?? width!,
              margin: margin,
              shape: shape,
              borderRadius: borderRadius,
              childInAvatar: childInAvatar,
            )
        : CachedNetworkImage(
            placeholderFadeInDuration: const Duration(milliseconds: delay200ms),
            fadeInDuration: const Duration(milliseconds: delay200ms),
            fadeOutDuration: const Duration(milliseconds: delay200ms),
            imageUrl: urlToImage!,
            imageBuilder: (context, imageProvider) => Container(
              height: height ?? width!,
              width: width ?? height!,
              margin: margin,
              decoration: BoxDecoration(
                shape: shape,
                borderRadius: borderRadius,
                image: DecorationImage(
                  colorFilter: colorFilter,
                  image: imageProvider,
                  fit: fit,
                  filterQuality: FilterQuality.low,
                ),
              ),
              alignment: Alignment.bottomRight,
              child: childInAvatar,
            ),
            placeholder: (context, url) =>
                placeholderWidget ??
                Container(
                  margin: margin,
                  child: PlaceHolderImage(
                    height: height ?? width!,
                    width: height ?? width!,
                    shape: shape,
                    borderRadius: borderRadius,
                  ),
                ),
            errorWidget: (context, url, error) =>
                placeholderWidget ??
                DefaultImage(
                  height: height ?? width!,
                  width: height ?? width!,
                  margin: margin,
                  shape: shape,
                  borderRadius: borderRadius,
                  childInAvatar: childInAvatar,
                ),
          );
  }
}
