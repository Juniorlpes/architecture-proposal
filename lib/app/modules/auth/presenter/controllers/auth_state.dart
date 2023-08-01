import 'package:architecture_proposal/app/modules/auth/domain/entities/login_failures.dart';
import 'package:architecture_proposal/app/modules/auth/domain/entities/user.dart';

abstract class AuthState {}

class InitialAuthState extends AuthState {}

class LoadingAuthState extends AuthState {}

class FailureAuthState extends AuthState {
  final LoginFailure loginFailure;

  FailureAuthState(this.loginFailure);
}

class SuccessAuthState extends AuthState {
  final User user;

  SuccessAuthState(this.user);
}
