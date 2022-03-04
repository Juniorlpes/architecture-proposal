import 'package:architecture_proposal/shared/domain/general_app_failure.dart';

abstract class LoginFailure extends GeneralAppFailure {
  LoginFailure({String? message}) : super(message: message);
}

class InvalidEmail extends LoginFailure {
  InvalidEmail({String? message}) : super(message: message ?? 'invalid email');
}

class InvalidPassword extends LoginFailure {
  InvalidPassword({String? message}) : super(message: message);
}

class UnknownEmailOrPassword extends LoginFailure {
  UnknownEmailOrPassword({String? message})
      : super(message: message ?? 'unknown email or password');
}

class OtherLoginError extends LoginFailure {
  OtherLoginError({String? message}) : super(message: message);
}
