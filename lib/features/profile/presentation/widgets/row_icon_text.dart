// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:streamskit_mobile/core/util/common/touchable_opacity.dart';
import 'package:streamskit_mobile/core/util/sizer_custom/sizer.dart';
import 'package:streamskit_mobile/core/util/styles/profile_style.dart';

class RowIconText extends StatelessWidget {
  final String title;
  final IconData? iconLeading;
  final Color? colorLeading;
  final double? sizeLeading;
  final IconData? iconSuffix;
  final Color? colorSuffix;
  final double? sizeSuffix;
  final TextStyle? textStyle;
  final Function()? onTap;
  const RowIconText({
    Key? key,
    required this.title,
    this.iconLeading,
    this.onTap,
    this.colorLeading,
    this.iconSuffix,
    this.colorSuffix,
    this.sizeLeading,
    this.sizeSuffix,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TouchableOpacity(
      onTap: onTap ?? () {},
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.sp),
        child: iconLeading == null
            ? Align(
                alignment: Alignment.center,
                child: Text(
                  title,
                  style: textStyle ?? text13mCL,
                ),
              )
            : Row(
                children: [
                  Icon(
                    iconLeading,
                    size: sizeLeading ?? 18.sp,
                    color: colorLeading,
                  ),
                  SizedBox(
                    width: 10.sp,
                  ),
                  Text(
                    title,
                    style: textStyle ?? text13mCL,
                  ),
                  const Spacer(),
                  iconSuffix != null
                      ? Padding(
                          padding: EdgeInsets.only(right: 8.0.sp),
                          child: Icon(
                            iconSuffix,
                            size: sizeSuffix ?? 9.sp,
                            color: colorSuffix,
                          ),
                        )
                      : const SizedBox()
                ],
              ),
      ),
    );
  }
}
