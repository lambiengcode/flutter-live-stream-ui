// Package imports:
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import 'package:streamskit_mobile/core/app/constant/storage_keys.dart';
import 'package:streamskit_mobile/features/home/data/model/live_stream_model.dart';

abstract class LocalLiveStreamSource {
  List<LiveStreamModel> getLiveStreams();
  void saveLiveStreams(List<LiveStreamModel> liveStreams);
  void clearLiveStreams();
}

@LazySingleton(as: LocalLiveStreamSource)
class LocalLiveStreamSourceImpl implements LocalLiveStreamSource {
  final Box hiveBox = Hive.box(StorageKeys.boxLiveStreams);

  @override
  List<LiveStreamModel> getLiveStreams() {
    List liveStreamsRaw = hiveBox.get(StorageKeys.liveStreamsKey) ?? [];
    return liveStreamsRaw
        .map((liveStream) => LiveStreamModel.fromJson(liveStream))
        .toList();
  }

  @override
  void saveLiveStreams(List<LiveStreamModel> liveStreams) {
    hiveBox.put(
      StorageKeys.liveStreamsKey,
      liveStreams.map((liveStream) => liveStream.toJson()).toList(),
    );
  }

  @override
  void clearLiveStreams() {
    hiveBox.delete(StorageKeys.liveStreamsKey);
  }
}
