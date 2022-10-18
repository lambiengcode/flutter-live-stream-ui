// Package imports:
import 'package:hive/hive.dart';

// Project imports:
import 'package:streamskit_mobile/core/app/constant/storage_keys.dart';
import 'package:streamskit_mobile/core/util/path_helper.dart';

class BaseLocalData {
  static Future<void> initialBox() async {
    String path = await PathHelper.localStoreDirStreamOS;
    Hive.init(path);
    await Hive.openBox(StorageKeys.boxSystem);
    await openBoxApp();
  }

  static Future<void> openBoxApp() async {
    await Hive.openBox(StorageKeys.boxAuth);
    await Hive.openBox(StorageKeys.boxUser);
    await Hive.openBox(StorageKeys.boxLiveStreams);
  }
}
