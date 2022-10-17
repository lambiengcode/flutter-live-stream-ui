import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:streamskit_mobile/core/injection/injection_container.dart';
import 'package:streamskit_mobile/features/auth/presentation/bloc/auth_bloc.dart';

class BlocProvider extends StatelessWidget {
  final Widget child;

  const BlocProvider({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.debugCheckInvalidValueType = null;

    return MultiProvider(
      providers: [
        Provider<AuthBloc>.value(value: AuthBloc(getIt())),
      ],
      child: child,
    );
  }
}
