import 'package:dartz/dartz.dart';
import 'package:streamskit_mobile/core/error/failure.dart';
import 'package:streamskit_mobile/features/home/data/model/live_stream_model.dart';

abstract class LiveStreamRepository {
  Either<Failure, List<LiveStreamModel>> getLiveStreams();
}
