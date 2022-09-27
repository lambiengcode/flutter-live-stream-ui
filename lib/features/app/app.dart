import 'dart:async';

import 'package:flutter/material.dart';
import 'package:streamskit_mobile/core/app/constants.dart';
import 'package:streamskit_mobile/core/app/themes/themes.dart';
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

class _AppState extends State<App> {
  bool _isInitial = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: delayASecond), () {
      setState(() {
        _isInitial = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: ((context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light().data,
          darkTheme: AppTheme.dark().data,
          themeMode: ThemeMode.dark,
          home: _isInitial ? const SplashScreen() : const Home(),
        );
      }),
    );
  }
}
