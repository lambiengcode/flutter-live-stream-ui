// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/app/bloc/app_bloc.dart' as _i3;
import '../../features/auth/data/datasources/auth_local_datasource.dart' as _i4;
import '../../features/auth/data/datasources/auth_remote_datasource.dart'
    as _i5;
import '../../features/auth/data/repositories/auth_repository_impl.dart' as _i7;
import '../../features/auth/domain/repositories/auth_repository.dart' as _i6;
import '../../features/auth/domain/usecases/check_logined.dart' as _i8;
import '../../features/auth/domain/usecases/sign_in_with_social.dart' as _i10;
import '../../features/auth/domain/usecases/sign_out.dart' as _i11;
import '../../features/auth/presentation/bloc/auth_bloc.dart' as _i12;
import '../../features/home/data/datasources/local_live_stream_source.dart'
    as _i9;
import '../../features/home/data/repositories/live_stream_repository_impl.dart'
    as _i14;
import '../../features/home/domain/repositories/live_stream_repository.dart'
    as _i13;
import '../../features/home/domain/usecases/get_list_live_streaming.dart'
    as _i15; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i3.AppBloc>(() => _i3.AppBloc());
  gh.lazySingleton<_i4.AuthLocalDataSource>(
      () => _i4.AuthLocalDataSourceImpl());
  gh.lazySingleton<_i5.AuthRemoteDataSource>(
      () => _i5.AuthRemoteDataSourceImpl());
  gh.lazySingleton<_i6.AuthRepository>(() => _i7.AuthRepositoryImpl(
        localData: get<_i4.AuthLocalDataSource>(),
        remoteData: get<_i5.AuthRemoteDataSource>(),
      ));
  gh.lazySingleton<_i8.CheckLogined>(
      () => _i8.CheckLogined(repository: get<_i6.AuthRepository>()));
  gh.lazySingleton<_i9.LocalLiveStreamSource>(
      () => _i9.LocalLiveStreamSourceImpl());
  gh.lazySingleton<_i10.SignInWithSocial>(
      () => _i10.SignInWithSocial(repository: get<_i6.AuthRepository>()));
  gh.lazySingleton<_i11.SignOut>(
      () => _i11.SignOut(repository: get<_i6.AuthRepository>()));
  gh.factory<_i12.AuthBloc>(() => _i12.AuthBloc(
        get<_i10.SignInWithSocial>(),
        get<_i8.CheckLogined>(),
        get<_i11.SignOut>(),
      ));
  gh.lazySingleton<_i13.LiveStreamRepository>(() =>
      _i14.LiveStreamRepositoryImpl(
          localData: get<_i9.LocalLiveStreamSource>()));
  gh.lazySingleton<_i15.GetListLiveStreaming>(() =>
      _i15.GetListLiveStreaming(repository: get<_i13.LiveStreamRepository>()));
  return get;
}
