part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class OnAuthCheckEvent extends AuthEvent {}

class SignInEvent extends AuthEvent {
  final AuthType authType;
  const SignInEvent({required this.authType});
}

class SignOutEvent extends AuthEvent {}
