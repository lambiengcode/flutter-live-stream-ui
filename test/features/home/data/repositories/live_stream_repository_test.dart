import 'dart:convert';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:streamskit_mobile/features/home/data/datasources/local_live_stream_source.dart';
import 'package:streamskit_mobile/features/home/data/model/live_stream_model.dart';
import 'package:streamskit_mobile/features/home/data/repositories/live_stream_repository_impl.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockLocalDataSource extends Mock implements LocalLiveStreamSource {
  @override
  List<LiveStreamModel> getLiveStreams() {
    return super.noSuchMethod(Invocation.method(#getLiveStreams, [])) ?? [];
  }
}

void main() {
  late LiveStreamRepositoryImpl repository;
  late MockLocalDataSource mockLocalDataSource;

  setUp(() {
    mockLocalDataSource = MockLocalDataSource();
    repository = LiveStreamRepositoryImpl(localData: mockLocalDataSource);
  });

  group('get live streams', () {
    final List<dynamic> arrayRaw =
        jsonDecode(fixture('live_stream_model.json'));
    final List<LiveStreamModel> liveStreams = arrayRaw
        .map(
          (liveStream) => LiveStreamModel.fromMap(liveStream),
        )
        .toList();

    test(
      'should return list live stream model',
      () async {
        // arrange
        when(mockLocalDataSource.getLiveStreams()).thenAnswer(
          (_) => liveStreams,
        );
        // act
        repository.getLiveStreams();
        // assert
        verifyNever(mockLocalDataSource.saveLiveStreams(liveStreams));
      },
    );
  });
}
