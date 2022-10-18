// Package imports:
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import 'package:streamskit_mobile/core/error/failure.dart';
import 'package:streamskit_mobile/core/usecase/usecase.dart';
import 'package:streamskit_mobile/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:streamskit_mobile/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:streamskit_mobile/features/auth/domain/entities/social.dart';
import 'package:streamskit_mobile/features/auth/domain/repositories/auth_repository.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthLocalDataSource localData;
  final AuthRemoteDataSource remoteData;

  const AuthRepositoryImpl({
    required this.localData,
    required this.remoteData,
  });

  @override
  Either<Failure, bool> checkSignined() {
    String? token = localData.getAccessToken();

    if (token == null) {
      return Left(NullValue());
    }

    return const Right(true);
  }

  @override
  Future<Either<Failure, bool>> signIn(Params params) async {
    String? accessToken = await remoteData.signInWithSocial(
      params.object as SocialValue,
    );

    if (accessToken != null) {
      localData.saveAccessToken(accessToken);
      return const Right(true);
    }

    return const Right(false);
  }

  @override
  Either<Failure, bool> signOut() {
    localData.clearAccessToken();
    return const Right(true);
  }
}
