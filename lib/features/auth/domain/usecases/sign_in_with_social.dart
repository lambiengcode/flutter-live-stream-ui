// Package imports:
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import 'package:streamskit_mobile/core/error/failure.dart';
import 'package:streamskit_mobile/core/usecase/usecase.dart';
import 'package:streamskit_mobile/features/auth/domain/repositories/auth_repository.dart';

@lazySingleton
class SignInWithSocial implements UseCaseFuture<bool, Params> {
  final AuthRepository repository;

  const SignInWithSocial({required this.repository});

  @override
  Future<Either<Failure, bool>> call(Params params) async {
    return repository.signIn(params);
  }
}
