import 'package:streamskit_mobile/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:streamskit_mobile/features/home/data/datasources/local_live_stream_source.dart';
import 'package:streamskit_mobile/features/home/data/model/user_model.dart';
import 'package:streamskit_mobile/features/login/domain/repositories/authenication_repository.dart';

class AuthenicationRepositoryImpl implements AuthenicationRepository {
  final LocalLiveStreamSource localData;

  const AuthenicationRepositoryImpl({required this.localData});

  @override
  Either<Failure, UserModel> loginApple() {
    throw UnimplementedError();
  }

  @override
  Either<Failure, UserModel> loginFacebook() {
    throw UnimplementedError();
  }

  @override
  Either<Failure, UserModel> loginGoogle() {
    throw UnimplementedError();
  }
}
