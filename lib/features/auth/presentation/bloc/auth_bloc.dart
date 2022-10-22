// Package imports:
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:streamskit_mobile/core/error/failure.dart';
import 'package:streamskit_mobile/core/navigator/app_pages.dart';
import 'package:streamskit_mobile/core/navigator/app_routes.dart';
import 'package:streamskit_mobile/core/usecase/usecase.dart';
import 'package:streamskit_mobile/core/util/firebase/firebase_auth.dart';
import 'package:streamskit_mobile/features/auth/domain/entities/auth_type.dart';
import 'package:streamskit_mobile/features/auth/domain/entities/social.dart';
import 'package:streamskit_mobile/features/auth/domain/usecases/check_logined.dart';
import 'package:streamskit_mobile/features/auth/domain/usecases/sign_in_with_social.dart';
import 'package:streamskit_mobile/features/auth/domain/usecases/sign_out.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final CheckLogined _checkLogined;
  final SignInWithSocial _signInWithSocial;
  final SignOut _signOut;
  AuthBloc(
    this._signInWithSocial,
    this._checkLogined,
    this._signOut,
  ) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is OnAuthCheckEvent) {
        checkLogined(emit);
      }

      if (event is SignInEvent) {
        await signIn(emit, authType: event.authType);
      }

      if (event is SignOutEvent) {
        signOut(emit);
      }
    });
  }

  // MARK: Private methods
  void checkLogined(Emitter<AuthState> emit) {
    Either<Failure, bool> hasLogined = _checkLogined.call(NoParams());
    hasLogined.fold((l) => emit(AuthFailure()), (r) => emit(AuthSuccess()));
  }

  Future<void> signIn(
    Emitter<AuthState> emit, {
    required AuthType authType,
  }) async {
    emit(Authenticating());
    late final SocialValue? socialValue;
    switch (authType) {
      case AuthType.google:
        socialValue = await signInWithGoogle();
        break;
      case AuthType.apple:
        socialValue = await signInWithApple();
        break;
      default:
        socialValue = await signInWithFacebook();
        break;
    }
    if (socialValue == null) {
      // Get credential id failure
      emit(AuthFailure());
    } else {
      Either<Failure, bool> signInSucceed = await _signInWithSocial.call(
        Params(object: socialValue),
      );

      signInSucceed.fold(
        (l) => emit(AuthFailure()),
        (r) => emit(AuthSuccess()),
      );
    }
  }

  void signOut(Emitter<AuthState> emit) async {
    Either<Failure, bool> signOutSucceed = _signOut.call(NoParams());
    signOutSucceed.fold((l) => l, (r) {
      emit(AuthFailure());
      AppNavigator.popUntil(Routes.rootRoute);
    });
  }
}
