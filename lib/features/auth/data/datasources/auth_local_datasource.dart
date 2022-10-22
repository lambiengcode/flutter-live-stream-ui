// Package imports:
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import 'package:streamskit_mobile/core/app/constant/storage_keys.dart';

abstract class AuthLocalDataSource {
  String? getAccessToken();
  void saveAccessToken(String accessToken);
  void clearAccessToken();
}

@LazySingleton(as: AuthLocalDataSource)
class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final Box hiveBox = Hive.box(StorageKeys.boxAuth);

  @override
  void clearAccessToken() {
    hiveBox.delete(StorageKeys.accessToken);
  }

  @override
  String? getAccessToken() {
    return hiveBox.get(StorageKeys.accessToken);
  }

  @override
  void saveAccessToken(String accessToken) {
    hiveBox.put(StorageKeys.accessToken, accessToken);
  }
}
