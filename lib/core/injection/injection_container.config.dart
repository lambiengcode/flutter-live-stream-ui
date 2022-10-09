// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/home/data/datasources/local_live_stream_source.dart'
    as _i3;
import '../../features/home/data/repositories/live_stream_repository_impl.dart'
    as _i5;
import '../../features/home/domain/repositories/live_stream_repository.dart'
    as _i4;
import '../../features/home/domain/usecases/get_list_live_streaming.dart'
    as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.lazySingleton<_i3.LocalLiveStreamSource>(
      () => _i3.LocalLiveStreamSourceImpl());
  gh.lazySingleton<_i4.LiveStreamRepository>(() => _i5.LiveStreamRepositoryImpl(
      localData: get<_i3.LocalLiveStreamSource>()));
  gh.lazySingleton<_i6.GetListLiveStreaming>(() =>
      _i6.GetListLiveStreaming(repository: get<_i4.LiveStreamRepository>()));
  return get;
}
