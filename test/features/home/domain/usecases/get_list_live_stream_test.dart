// Package imports:
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// Project imports:
import 'package:streamskit_mobile/core/error/failure.dart';
import 'package:streamskit_mobile/core/usecase/usecase.dart';
import 'package:streamskit_mobile/features/home/data/model/live_stream_model.dart';
import 'package:streamskit_mobile/features/home/domain/repositories/live_stream_repository.dart';
import 'package:streamskit_mobile/features/home/domain/usecases/get_list_live_streaming.dart';

@GenerateMocks([LiveStreamModel])
List<LiveStreamModel> liveStreams = listLiveStreamFake;

class MockLiveStreamRepository extends Mock implements LiveStreamRepository {
  @override
  Either<Failure, List<LiveStreamModel>> getLiveStreams() {
    return (super.noSuchMethod(Invocation.method(#getTodos, [])) ??
        Right(liveStreams));
  }
}

void main() {
  late GetListLiveStreaming usecase;
  late MockLiveStreamRepository mockLiveStreamRepository;

  setUp(() {
    mockLiveStreamRepository = MockLiveStreamRepository();
    usecase = GetListLiveStreaming(repository: mockLiveStreamRepository);
  });

  test(
    'should get list live streams from repository',
    () async {
      when(mockLiveStreamRepository.getLiveStreams())
          .thenAnswer((_) => Right(liveStreams));
      // act
      final result = usecase(NoParams());
      // assert
      expect(result.isRight(),
          Right<Failure, List<LiveStreamModel>>(liveStreams).isRight());
      verify(mockLiveStreamRepository.getLiveStreams());
      verifyNoMoreInteractions(mockLiveStreamRepository);
    },
  );
}
