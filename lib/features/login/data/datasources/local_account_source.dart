import 'package:hive/hive.dart';
import 'package:streamskit_mobile/core/app/constant/storage_keys.dart';
import 'package:streamskit_mobile/features/home/data/model/user_model.dart';

abstract class LocalUserSource {
  UserModel getUser();
  String getAccessToken();
  String getBackupToken();
  void saveAccount(UserModel userModel);
  void saveAccessToken(String token);
  void saveBackupToken(String token);
  void clearAccessToken();
  void clearBackupToken();
  void clearUser();
}

class LocalUserSourceImpl implements LocalUserSource {
  final Box hiveBox;
  const LocalUserSourceImpl({required this.hiveBox});

  @override
  UserModel getUser() {
    var accountLocal = hiveBox.get(StorageKeys.account);
    if (accountLocal == null) {
      return UserModel(
        id: '',
        isExpert: false,
        fullName: '',
        urlToImage: '',
      );
    }
    return UserModel.fromJson(accountLocal);
  }

  @override
  String getAccessToken() {
    return hiveBox.get(StorageKeys.token) ?? '';
  }

  @override
  String getBackupToken() {
    return hiveBox.get(StorageKeys.backupToken);
  }

  @override
  void saveAccount(UserModel userModel) {
    hiveBox.put(StorageKeys.account, userModel.toJson());
  }

  @override
  void saveAccessToken(String token) {
    hiveBox.put(StorageKeys.token, token);
  }

  @override
  void saveBackupToken(String token) {
    hiveBox.put(StorageKeys.backupToken, token);
  }

  @override
  void clearAccessToken() {
    hiveBox.delete(StorageKeys.token);
  }

  @override
  void clearBackupToken() {
    hiveBox.delete(StorageKeys.backupToken);
  }

  @override
  void clearUser() {
    hiveBox.delete(StorageKeys.account);
  }
}
