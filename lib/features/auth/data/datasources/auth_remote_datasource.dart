import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:streamskit_mobile/core/app/config/base_remote_data.dart';
import 'package:streamskit_mobile/core/app/constant/endpoints.dart';
import 'package:streamskit_mobile/core/types/http_status_code.dart';
import 'package:streamskit_mobile/features/auth/domain/entities/social.dart';

abstract class AuthRemoteDataSource {
  Future<String?> signInWithSocial(SocialValue socialValue);
}

@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  @override
  Future<String?> signInWithSocial(SocialValue socialValue) async {
    Map<String, dynamic> body = socialValue.toMap();
    Response response = await BaseRemoteData().postRoute(
      Endpoints.signIn,
      body,
    );

    if (response.statusCode == StatusCode.ok) {
      return response.data['data'];
    }

    return null;
  }
}
