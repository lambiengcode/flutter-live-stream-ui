// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:streamskit_mobile/core/error/failure.dart';
import 'package:streamskit_mobile/core/usecase/usecase.dart';

abstract class AuthRepository {
  Future<Either<Failure, bool>> signIn(Params params);

  Either<Failure, bool> checkSignined();

  Either<Failure, bool> signOut();
}
