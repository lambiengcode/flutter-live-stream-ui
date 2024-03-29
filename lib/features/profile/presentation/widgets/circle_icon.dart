// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:streamskit_mobile/core/util/common/touchable_opacity.dart';

class CircleIcon extends StatelessWidget {
  final IconData icon;
  final Function()? onTap;
  final Color? colorIcon;
  final Color? backgroundIcon;
  final double? sizeIcon;
  const CircleIcon({
    Key? key,
    required this.icon,
    this.onTap,
    this.colorIcon,
    this.backgroundIcon,
    this.sizeIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TouchableOpacity(
      onTap: onTap ?? () {},
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: backgroundIcon ?? const Color(0xff5a5959),
        ),
        child: Icon(
          icon,
          color: colorIcon ?? Colors.white,
          size: sizeIcon,
        ),
      ),
    );
  }
}
