// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Project imports:
import 'package:streamskit_mobile/core/app/colors/app_color.dart';

class AppTheme {
  AppTheme({
    required this.data,
  });

  factory AppTheme.light({bool isChild = false}) {
    final appColors = AppColors.light();
    final themeData = ThemeData(
      useMaterial3: true,
      pageTransitionsTheme: isChild
          ? const PageTransitionsTheme(builders: {
              TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
              TargetPlatform.android: ZoomPageTransitionsBuilder(),
            })
          : const PageTransitionsTheme(builders: {
              TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
              TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            }),
      brightness: Brightness.light,
      primaryColor: appColors.primary,
      primaryColorLight: appColors.primaryLight,
      primaryColorDark: appColors.primaryDark,
      focusColor: appColors.focusColor,
      disabledColor: appColors.unFocusColor,
      scaffoldBackgroundColor: appColors.background,
      snackBarTheme: SnackBarThemeData(
        backgroundColor: appColors.error,
        behavior: SnackBarBehavior.floating,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: appColors.background,
        selectedItemColor: colorPrimary,
      ),
      appBarTheme: AppBarTheme(
        scrolledUnderElevation: 0,
        surfaceTintColor: appColors.background,
        backgroundColor: appColors.background,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.light ==
                  (Platform.isAndroid ? Brightness.dark : Brightness.light)
              ? Brightness.light
              : Brightness.dark,
          statusBarIconBrightness: Brightness.light ==
                  (Platform.isAndroid ? Brightness.dark : Brightness.light)
              ? Brightness.light
              : Brightness.dark,
        ),
        iconTheme: IconThemeData(
          color: appColors.contentText1,
        ),
      ),
      textTheme: TextTheme(
        headline1: TextStyle(color: appColors.header),
        headline2: TextStyle(color: appColors.header),
        bodyText1: TextStyle(color: appColors.contentText1),
        bodyText2: TextStyle(color: appColors.contentText2),
        subtitle1: TextStyle(color: appColors.subText1),
        subtitle2: TextStyle(color: appColors.subText2),
      ),
      dividerColor: appColors.divider,
      backgroundColor: appColors.dividerBackgroundColor,
    );
    return AppTheme(
      data: themeData,
    );
  }

  factory AppTheme.dark({bool isChild = false}) {
    final appColors = AppColors.dark();
    final themeData = ThemeData(
      useMaterial3: true,
      pageTransitionsTheme: isChild
          ? const PageTransitionsTheme(builders: {
              TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
              TargetPlatform.android: ZoomPageTransitionsBuilder(),
            })
          : const PageTransitionsTheme(builders: {
              TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
              TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            }),
      brightness: Brightness.dark,
      primaryColor: appColors.primary,
      primaryColorLight: appColors.primaryLight,
      primaryColorDark: appColors.primaryDark,
      focusColor: appColors.focusColor,
      disabledColor: appColors.unFocusColor,
      scaffoldBackgroundColor: appColors.background,
      snackBarTheme: SnackBarThemeData(
        backgroundColor: appColors.error,
        behavior: SnackBarBehavior.floating,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: appColors.background,
        selectedItemColor: colorPrimary,
      ),
      appBarTheme: AppBarTheme(
        scrolledUnderElevation: 0,
        surfaceTintColor: appColors.background,
        backgroundColor: appColors.background,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.dark ==
                  (Platform.isAndroid ? Brightness.dark : Brightness.light)
              ? Brightness.light
              : Brightness.dark,
          statusBarIconBrightness: Brightness.dark ==
                  (Platform.isAndroid ? Brightness.dark : Brightness.light)
              ? Brightness.light
              : Brightness.dark,
        ),
        iconTheme: IconThemeData(
          color: appColors.contentText1,
        ),
      ),
      textTheme: TextTheme(
        headline1: TextStyle(color: appColors.header),
        headline2: TextStyle(color: appColors.header),
        bodyText1: TextStyle(color: appColors.contentText1),
        bodyText2: TextStyle(color: appColors.contentText2),
        subtitle1: TextStyle(color: appColors.subText1),
        subtitle2: TextStyle(color: appColors.subText2),
      ),
      dividerColor: appColors.divider,
      backgroundColor: appColors.dividerBackgroundColor,
    );
    return AppTheme(
      data: themeData,
    );
  }

  final ThemeData data;
}
