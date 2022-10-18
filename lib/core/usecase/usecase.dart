// Package imports:
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

// Project imports:
import 'package:streamskit_mobile/core/error/failure.dart';

abstract class UseCase<Type, Params> {
  Either<Failure, Type> call(Params params);
}

abstract class UseCaseFuture<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}

class Params extends Equatable {
  final Object object;

  const Params({required this.object});

  @override
  List<Object> get props => [object];
}
