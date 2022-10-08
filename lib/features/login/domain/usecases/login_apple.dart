import 'package:dartz/dartz.dart';
import 'package:streamskit_mobile/core/error/failure.dart';
import 'package:streamskit_mobile/core/usecase/usecase.dart';
import 'package:streamskit_mobile/features/home/data/model/user_model.dart';
import 'package:streamskit_mobile/features/login/domain/repositories/authenication_repository.dart';

class LoginApple implements UseCase<UserModel, NoParams> {
  final AuthenicationRepository repository;

  const LoginApple({required this.repository});

  @override
  Either<Failure, UserModel> call(NoParams params) {
    return repository.loginApple();
  }
}
