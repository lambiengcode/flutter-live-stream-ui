import 'package:flutter/material.dart';
import 'package:streamskit_mobile/core/app/colors/app_color.dart';

class BoxShadowStatic {
  static List<BoxShadow>? boxShadow(BuildContext context) {
    if (Theme.of(context).brightness == Brightness.dark) {
      return [
        BoxShadow(
          color: const Color(0xFF14171A).withOpacity(.65),
          offset: const Offset(.75, .75),
          blurRadius: .4,
        ),
        BoxShadow(
          color: colorBlack.withOpacity(.25),
          offset: const Offset(-.4, -.4),
          blurRadius: .4,
        ),
      ];
    } else {
      return [
        BoxShadow(
          color: Colors.black.withOpacity(0.08),
          blurRadius: 4,
          offset: const Offset(1, 1),
        ),
      ];
    }
  }

  static List<BoxShadow>? boxShadowActive(BuildContext context) {
    if (Theme.of(context).brightness == Brightness.dark) {
      return [
        BoxShadow(
          color: Colors.black.withOpacity(.8),
          offset: const Offset(1, 1),
          blurRadius: 1,
        ),
        BoxShadow(
          color: colorBlack.withOpacity(.35),
          offset: const Offset(-1, -1),
          blurRadius: 1,
        ),
      ];
    } else {
      return [
        BoxShadow(
          color: Colors.black.withOpacity(0.08),
          blurRadius: 4,
          offset: const Offset(1, 1),
        ),
      ];
    }
  }
}
