// Flutter imports:
import 'package:flutter/material.dart';

var colorBlack = const Color(0xFF121212);
var colorPrimaryBlack = const Color(0xFF121212);
var colorDarkGrey = const Color(0xFF657786);
var colorPrimary = const Color(0xFF1DA1F2);
var colorTitle = const Color(0xFF2C3D50);
var colorReds400 = Colors.red.shade400;
var colorBorderAvatar = const Color(0xff3e455b);

var colorBlack1 = const Color(0xFF191414);
var colorPink = const Color(0xFFcd32d7);
var colorPurple2 = const Color(0xFFa9ade6);
var colorBlack2 = const Color(0xFF303234);
var colorRed = const Color(0xFFf11a42);
var colorBlue = const Color(0xFF1d51fe);
var colorPurple = const Color(0xFF7d60e5);
var colorHintText = const Color(0xFFa0a0a0);

var colorHigh = Colors.redAccent;
var colorMedium = Colors.amber.shade700;
var colorLow = colorPrimary;
var colorCompleted = Colors.green;
var colorFailed = colorDarkGrey;
var colorActive = const Color(0xFF00D72F);
var colorGreenLight = const Color(0xFF009E60);
var colorAttendance = const Color(0xFF0CCF4C);

var colorBlueGrey = const Color(0xFF455A64);
var colorBlueGreyIos = const Color(0xFF1C1F2E);

var colorGreyWhite = const Color(0x4dE3E3E3);
var colorGreyWhite2 = const Color(0xFFE3E3E3);
var colorCaptionSearch = const Color(0xFFA3A3A3);

Color colorDividerTimeline = const Color(0xFFC5D0CF);

Color mC = Colors.grey.shade100;
Color mCL = Colors.white;
Color mCM = Colors.grey.shade200;
Color mCU = Colors.grey.shade300;
Color mCH = Colors.grey.shade400;
Color mGB = Colors.grey.shade500;
Color mGM = Colors.grey.shade700;
Color mGE = Colors.grey.shade800;
Color mGD = Colors.grey.shade900;
Color mCD = Colors.black.withOpacity(0.075);
Color mCC = Colors.green.withOpacity(0.65);
Color fCD = Colors.grey.shade700;
Color fCL = Colors.grey;

class AppColors {
  final Color primary;
  final Color primaryLight;
  final Color primaryDark;
  final Color background;
  final Color focusColor;
  final Color unFocusColor;
  final Color accent;
  final Color disabled;
  final Color error;
  final Color divider;
  final Color dividerBackgroundColor;
  final Color header;
  final Color button;
  final Color contentText1;
  final Color contentText2;
  final Color subText1;
  final Color subText2;

  const AppColors({
    required this.header,
    required this.primary,
    required this.primaryLight,
    required this.primaryDark,
    required this.background,
    required this.focusColor,
    required this.unFocusColor,
    required this.accent,
    required this.disabled,
    required this.error,
    required this.divider,
    required this.dividerBackgroundColor,
    required this.button,
    required this.contentText1,
    required this.contentText2,
    required this.subText1,
    required this.subText2,
  });

  factory AppColors.light() {
    return AppColors(
      header: colorBlack,
      primary: colorPrimary,
      primaryLight: mCL,
      primaryDark: colorBlack,
      background: Colors.white,
      focusColor: Colors.green,
      unFocusColor: Colors.grey,
      accent: const Color(0xFF17c063),
      disabled: Colors.black12,
      error: const Color(0xFFFF7466),
      divider: Colors.black26,
      dividerBackgroundColor: Colors.black54,
      button: const Color(0xFF657786),
      contentText1: colorBlack,
      contentText2: colorBlack,
      subText1: mGD,
      subText2: mGB,
    );
  }

  factory AppColors.dark() {
    return AppColors(
      header: colorBlack,
      primary: colorPrimary,
      primaryLight: mCL,
      primaryDark: colorBlack,
      background: colorPrimaryBlack,
      focusColor: Colors.green,
      unFocusColor: Colors.grey,
      accent: const Color(0xFF17c063),
      disabled: Colors.black12,
      error: const Color(0xFFFF7466),
      divider: Colors.white24,
      dividerBackgroundColor: Colors.black54,
      button: const Color(0xFF657786),
      contentText1: mCL,
      contentText2: mC,
      subText1: mCH,
      subText2: mGB,
    );
  }
}
