// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:phosphor_flutter/phosphor_flutter.dart';

// Project imports:
import 'package:streamskit_mobile/core/app/colors/app_color.dart';
import 'package:streamskit_mobile/core/util/common/touchable_opacity.dart';
import 'package:streamskit_mobile/core/util/sizer_custom/sizer.dart';

class ButtonCircle extends StatelessWidget {
  final IconData? icon;
  final Function() onTap;
  const ButtonCircle({super.key, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return TouchableOpacity(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: fCD,
          shape: BoxShape.circle,
        ),
        padding: EdgeInsets.all(7.sp),
        child: Icon(
          icon ?? PhosphorIcons.moonLight,
          color: Colors.white,
          size: 18.sp,
        ),
      ),
    );
  }
}
