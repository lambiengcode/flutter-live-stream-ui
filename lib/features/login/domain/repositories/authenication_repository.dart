import 'package:dartz/dartz.dart';
import 'package:streamskit_mobile/core/error/failure.dart';
import 'package:streamskit_mobile/features/home/data/model/user_model.dart';

abstract class AuthenicationRepository {
  Either<Failure, UserModel> loginGoogle();
  Either<Failure, UserModel> loginFacebook();
  Either<Failure, UserModel> loginApple();
}
