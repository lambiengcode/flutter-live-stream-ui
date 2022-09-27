import 'package:flutter/material.dart';
import 'package:streamskit_mobile/core/app/themes/themes.dart';
import 'package:streamskit_mobile/core/util/sizer_custom/sizer.dart';
import 'package:streamskit_mobile/features/home.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AppState();
  }
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: ((context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light().data,
          darkTheme: AppTheme.dark().data,
          themeMode: ThemeMode.dark,
          home: const Home(),
        );
      }),
    );
  }
}
