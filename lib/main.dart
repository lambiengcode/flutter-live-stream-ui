// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:streamskit_mobile/core/app/application.dart';
import 'package:streamskit_mobile/features/app/app.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Application.initialAppLication();
  runApp(const App());
}
