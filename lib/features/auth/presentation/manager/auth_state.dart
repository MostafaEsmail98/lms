part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoadingSignIn extends AuthState {}

final class AuthSuccessSignIn extends AuthState {
  final UserEntity user;

  AuthSuccessSignIn(this.user);
}

final class AuthErrorSignIn extends AuthState {
  final String message;

  AuthErrorSignIn(this.message);
}

final class AuthLoadingSignUp extends AuthState {}

final class AuthSuccessSignUp extends AuthState {
  final UserEntity user;

  AuthSuccessSignUp(this.user);
}

final class AuthErrorSignUp extends AuthState {
  final String message;

  AuthErrorSignUp(this.message);
}
