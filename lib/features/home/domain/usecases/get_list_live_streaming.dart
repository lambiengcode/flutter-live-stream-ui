import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:streamskit_mobile/core/error/failure.dart';
import 'package:streamskit_mobile/core/usecase/usecase.dart';
import 'package:streamskit_mobile/features/home/data/model/live_stream_model.dart';
import 'package:streamskit_mobile/features/home/domain/repositories/live_stream_repository.dart';

@lazySingleton
class GetListLiveStreaming implements UseCase<List<LiveStreamModel>, NoParams> {
  final LiveStreamRepository repository;

  const GetListLiveStreaming({required this.repository});

  @override
  Either<Failure, List<LiveStreamModel>> call(NoParams params) {
    return repository.getLiveStreams();
  }
}
