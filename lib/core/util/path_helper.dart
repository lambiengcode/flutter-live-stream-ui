// ignore_for_file: depend_on_referenced_packages

import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:streamskit_mobile/core/util/logger.dart';

class PathHelper {
  static Future<void> deleteCacheImageDir(String path) async {
    final cacheDir = Directory(path);
    if (cacheDir.existsSync()) {
      cacheDir.deleteSync(recursive: true);
    }
  }

  static Future<void> createDirStreamOS() async {
    String tempAskanyDir = await tempDirStreamOS;
    String localStoreAskanyDir = await localStoreDirStreamOS;
    Directory myDir = Directory(tempAskanyDir);
    Directory localDir = Directory(localStoreAskanyDir);
    if (!myDir.existsSync()) {
      await myDir.create();
    }

    if (!localDir.existsSync()) {
      await localDir.create();
    }
  }

  static Future<String> get tempDirStreamOS async =>
      '${(await getTemporaryDirectory()).path}/streamOS';

  static Future<String> get localStoreDirStreamOS async =>
      '${(await getTemporaryDirectory()).path}/hive';

  static Future<Directory> get appDir async =>
      await getApplicationDocumentsDirectory();

  static Future<Directory?> get downloadsDir async {
    Directory downloadsDirectory;
    try {
      if (Platform.isIOS) {
        downloadsDirectory = await getLibraryDirectory();
      } else {
        downloadsDirectory = await getApplicationSupportDirectory();
      }

      return downloadsDirectory;
    } on PlatformException {
      UtilLogger.log('Could not get the downloads directory');
      return null;
    }
  }

  static Future<int> getTempSize() async {
    String tempAskanyDir = await tempDirStreamOS;
    Directory myDir = Directory(tempAskanyDir);

    if (!myDir.existsSync()) return 0;

    return myDir.listSync().isEmpty ? 0 : ((myDir.statSync().size - 64) * 1024);
  }

  static Future<void> clearTempDir() async {
    String tempAskanyDir = await tempDirStreamOS;
    Directory myDir = Directory(tempAskanyDir);

    if (!myDir.existsSync()) return;

    myDir.deleteSync(recursive: true);
    myDir.create();
  }
}
