import 'package:streamskit_mobile/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:streamskit_mobile/features/home/data/datasources/local_live_stream_source.dart';
import 'package:streamskit_mobile/features/home/data/model/live_stream_model.dart';
import 'package:streamskit_mobile/features/home/domain/repositories/live_stream_repository.dart';

class LiveStreamRepositoryImpl implements LiveStreamRepository {
  final LocalLiveStreamSource localData;

  const LiveStreamRepositoryImpl({required this.localData});

  @override
  Either<Failure, List<LiveStreamModel>> getLiveStreams() {
    return Right(localData.getLiveStreams());
  }
}
