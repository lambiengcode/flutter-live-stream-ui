// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:streamskit_mobile/core/app/constant/constants.dart';

class AppMaterialPageRoute<T> extends MaterialPageRoute<T> {
  AppMaterialPageRoute({
    required WidgetBuilder builder,
    required RouteSettings settings,
  }) : super(builder: builder, settings: settings);

  @override
  Duration get transitionDuration => const Duration(
        milliseconds: durationDefaultAnimation,
      );

  @override
  @protected
  bool get hasScopedWillPopCallback {
    return Platform.isIOS ? true : false;
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    final PageTransitionsTheme theme = Theme.of(context).pageTransitionsTheme;
    return theme.buildTransitions<T>(
      this,
      context,
      animation,
      secondaryAnimation,
      child,
    );
  }
}
