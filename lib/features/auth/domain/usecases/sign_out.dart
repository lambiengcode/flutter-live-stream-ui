// Package imports:
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import 'package:streamskit_mobile/core/error/failure.dart';
import 'package:streamskit_mobile/core/usecase/usecase.dart';
import 'package:streamskit_mobile/features/auth/domain/repositories/auth_repository.dart';

@lazySingleton
class SignOut implements UseCase<bool, NoParams> {
  final AuthRepository repository;

  const SignOut({required this.repository});

  @override
  Either<Failure, bool> call(NoParams noParams) {
    return repository.signOut();
  }
}
