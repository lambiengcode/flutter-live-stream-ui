import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

AppBar appBarBrighnessDark({
  required BuildContext context,
  Brightness? brightness,
  Color? backgroundColor,
}) {
  return AppBar(
    toolbarHeight: 0.0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: (brightness ?? Theme.of(context).brightness) ==
              (Platform.isAndroid ? Brightness.dark : Brightness.light)
          ? Brightness.light
          : Brightness.dark,
      statusBarIconBrightness: (brightness ?? Theme.of(context).brightness) ==
              (Platform.isAndroid ? Brightness.dark : Brightness.light)
          ? Brightness.light
          : Brightness.dark,
    ),
    backgroundColor: backgroundColor ?? Colors.transparent,
    surfaceTintColor:
        backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
    elevation: 0.0,
    automaticallyImplyLeading: false,
    centerTitle: true,
  );
}
