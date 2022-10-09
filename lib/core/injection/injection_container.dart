import 'package:get_it/get_it.dart';
import 'package:streamskit_mobile/core/app/config/base_local_data.dart';
import 'package:streamskit_mobile/features/home/data/datasources/local_live_stream_source.dart';
import 'package:streamskit_mobile/features/home/data/repositories/live_stream_repository_impl.dart';
import 'package:streamskit_mobile/features/home/domain/repositories/live_stream_repository.dart';
import 'package:streamskit_mobile/features/home/domain/usecases/get_list_live_streaming.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - Home
  // Use cases
  sl.registerLazySingleton(() => GetListLiveStreaming(repository: sl()));

  // Repository
  sl.registerLazySingleton<LiveStreamRepository>(
    () => LiveStreamRepositoryImpl(
      localData: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<LocalLiveStreamSource>(
    () => LocalLiveStreamSourceImpl(hiveBox: sl()),
  );

  //! External
  await BaseLocalData.openBoxApp();
}
