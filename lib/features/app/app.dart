// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:streamskit_mobile/core/app/constant/constants.dart';
import 'package:streamskit_mobile/core/app/themes/themes.dart';
import 'package:streamskit_mobile/core/navigator/app_pages.dart';
import 'package:streamskit_mobile/core/util/after_layout_mixin.dart';
import 'package:streamskit_mobile/core/util/sizer_custom/sizer.dart';
import 'package:streamskit_mobile/features/home.dart';
import 'package:streamskit_mobile/features/home/presentation/splash_screen.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AppState();
  }
}

class _AppState extends State<App> with AfterLayoutMixin {
  bool _isInitial = true;

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: ((context, orientation, deviceType) {
        return MaterialApp(
          navigatorKey: AppNavigator.navigatorKey,
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light().data,
          darkTheme: AppTheme.dark().data,
          themeMode: ThemeMode.dark,
          navigatorObservers: [NavigatorObserver()],
          onGenerateRoute: (settings) {
            return AppNavigator().getRoute(settings);
          },
          home: _isInitial ? const SplashScreen() : const Home(),
        );
      }),
    );
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    Future.delayed(const Duration(milliseconds: delayASecond), () {
      setState(() {
        _isInitial = false;
      });
    });
  }
}
