// Package imports:
import 'package:dartz/dartz.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:rxdart/rxdart.dart';

// Project imports:
import 'package:streamskit_mobile/core/error/failure.dart';
import 'package:streamskit_mobile/core/usecase/usecase.dart';
import 'package:streamskit_mobile/core/util/firebase/firebase_auth.dart';
import 'package:streamskit_mobile/features/auth/domain/entities/social.dart';
import 'package:streamskit_mobile/features/auth/domain/usecases/sign_in_with_social.dart';

enum AuthType {
  google,
  facebook,
  apple,
}

class AuthBloc {
  AuthBloc(this._signInWithSocial);
  final SignInWithSocial _signInWithSocial;

  final BehaviorSubject<bool> _loading = BehaviorSubject<bool>();

  Stream<bool> get loading => _loading.stream;
  void _setLoading(bool value) => _loading.sink.add(value);

  void signIn(AuthType authType) async {
    _setLoading(true);
    late final SocialValue? socialValue;
    switch (authType) {
      case AuthType.google:
        socialValue = await signInWithGoogle();
        break;
      case AuthType.apple:
        socialValue = await signInWithApple();
        break;
      default:
        socialValue = await signInWithFacebook(LoginBehavior.nativeOnly);
        break;
    }
    if (socialValue == null) {
      // Get credential id failure
      _setLoading(false);
    } else {
      Either<Failure, bool> signInSucceed = await _signInWithSocial.call(
        Params(object: socialValue),
      );

      signInSucceed.fold((l) => null, (r) => r);
      _setLoading(false);
    }
  }
}
