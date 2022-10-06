import 'package:streamskit_mobile/core/app/config/base_local_data.dart';
import 'package:streamskit_mobile/core/injection/injection_container.dart'
    as di;
import 'package:flutter/material.dart';
import 'package:streamskit_mobile/core/util/path_helper.dart';

class Application {
  /// [Production - Dev]
  static Future<void> initialAppLication() async {
    try {
      // Prepare path cache
      await PathHelper.createDirStreamOS();

      // Init Hive
      await BaseLocalData.initialBox();

      // Init dependency injection
      await di.init();
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  ///Singleton factory
  static final Application _instance = Application._internal();

  factory Application() {
    return _instance;
  }

  Application._internal();
}
