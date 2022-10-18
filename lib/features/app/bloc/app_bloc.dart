import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:streamskit_mobile/core/injection/injection_container.dart';
import 'package:streamskit_mobile/features/auth/presentation/bloc/auth_bloc.dart';

class AppBloc {
  static final AuthBloc authBloc = getIt<AuthBloc>();
  static final List<BlocProvider> providers = [
    BlocProvider<AuthBloc>(
      create: (context) => authBloc..add(OnAuthCheckEvent()),
    ),
  ];

  ///Singleton factory
  static final AppBloc _instance = AppBloc._internal();

  factory AppBloc() {
    return _instance;
  }

  AppBloc._internal();
}
