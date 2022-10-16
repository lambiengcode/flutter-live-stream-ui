// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:streamskit_mobile/features/home/data/model/live_stream_model.dart';
import '../../../../fixtures/fixture_reader.dart';

void main() {
  final LiveStreamModel liveStreamModel = listLiveStreamFake[0];

  test(
    'should be a subclass of LiveStream entity',
    () async {
      // assert
      expect(liveStreamModel, isA<LiveStreamModel>());
    },
  );

  group('fromMap', () {
    test(
      'should return a valid model when the JSON',
      () async {
        // arrange
        final List<dynamic> arrayRaw =
            jsonDecode(fixture('live_stream_model.json'));
        // act
        final List<LiveStreamModel> result = arrayRaw
            .map<LiveStreamModel>(
                (liveStreamJson) => LiveStreamModel.fromMap(liveStreamJson))
            .toList();
        // assert
        expect(result.length, arrayRaw.length);
      },
    );
  });

  group('toMap', () {
    test(
      'should return a MAP map containing the proper data',
      () async {
        // act
        final result = liveStreamModel.toMap();
        // assert
        final expectedMap = {
          'peopleParticipant': 910,
          'type': 1,
          'urlToImage': urlImageGame,
        };
        expect(result, expectedMap);
      },
    );
  });

  group('toJson', () {
    test(
      'should return a JSON map containing the proper data',
      () async {
        // act
        final result = liveStreamModel.toJson();
        // assert
        final expectedMap = {
          'peopleParticipant': 910,
          'type': 1,
          'urlToImage': urlImageGame,
        };
        expect(result, jsonEncode(expectedMap));
      },
    );
  });
}
