// Package imports:
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// Project imports:
import 'package:streamskit_mobile/core/error/failure.dart';
import 'package:streamskit_mobile/core/usecase/usecase.dart';
import 'package:streamskit_mobile/features/auth/domain/entities/social.dart';
import 'package:streamskit_mobile/features/auth/domain/repositories/auth_repository.dart';
import 'package:streamskit_mobile/features/auth/domain/usecases/sign_in_with_social.dart';
import 'sign_in_with_social_test.mocks.dart';

@GenerateNiceMocks([MockSpec<AuthRepository>()])
SocialValue fakeSocialValue = SocialValue(
  fullName: 'lambiengcode',
  googleId: 'lambiengcodeId',
);
SocialValue fakeWrongSocialValue = SocialValue(
  fullName: 'lambiengcode',
  googleId: 'lambiengcodeId1',
);

void main() {
  late SignInWithSocial usecase;
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    usecase = SignInWithSocial(repository: mockAuthRepository);
  });

  test(
    'should sign in successful',
    () async {
      when(
        mockAuthRepository.signIn(
          Params(object: fakeSocialValue),
        ),
      ).thenAnswer((realInvocation) => Future.value(const Right(true)));
      // act
      final Either<Failure, bool> result = await usecase(
        Params(object: fakeSocialValue),
      );
      // assert
      expect(
        result.isRight(),
        const Right<Failure, bool>(true).isRight(),
      );
      verify(mockAuthRepository.signIn(Params(object: fakeSocialValue)));
      verifyNoMoreInteractions(mockAuthRepository);
    },
  );

  test(
    'should sign in failure - wrong email/password',
    () async {
      when(
        mockAuthRepository.signIn(
          Params(object: fakeWrongSocialValue),
        ),
      ).thenAnswer((realInvocation) => Future.value(const Right(false)));
      // act
      final Either<Failure, bool> result = await usecase(
        Params(object: fakeWrongSocialValue),
      );
      // assert
      expect(
        result.isRight(),
        const Right<Failure, bool>(false).isRight(),
      );
      verify(mockAuthRepository.signIn(Params(object: fakeWrongSocialValue)));
      verifyNoMoreInteractions(mockAuthRepository);
    },
  );

  test(
    'should sign in failure - param is not SocialValue',
    () async {
      // act
      final Either<Failure, bool> result = await usecase(
        const Params(object: {}),
      );
      // assert
      expect(
        result.isLeft(),
        true,
      );
      verifyNever(
        mockAuthRepository.signIn(
          Params(object: fakeWrongSocialValue),
        ),
      );
    },
  );
}
