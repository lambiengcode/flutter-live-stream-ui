import 'package:flutter/material.dart';

class CircleIcon extends StatelessWidget {
  final IconData icon;
  final Function()? onTap;
  final Color? colorIcon;
  final Color? backgroundIcon;
  const CircleIcon({
    Key? key,
    required this.icon,
    this.onTap,
    this.colorIcon,
    this.backgroundIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
        ),
      ),
    );
  }
}
