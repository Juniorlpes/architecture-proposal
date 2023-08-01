import 'package:architecture_proposal/app/modules/auth/domain/usecases/login.dart';
import 'package:architecture_proposal/app/modules/auth/presenter/controllers/auth_state.dart';
import 'package:flutter/foundation.dart';

export 'package:architecture_proposal/app/modules/auth/presenter/controllers/auth_state.dart';

class AuthStore extends ValueNotifier<AuthState> {
  final Login _login;

  AuthStore(this._login) : super(InitialAuthState());

  Future<void> login({required String email, required String password}) async {
    value = LoadingAuthState();

    final result = await _login(email: email, password: password);
    result.fold(
      (failure) => value = FailureAuthState(failure),
      (data) => value = SuccessAuthState(data),
    );
  }
}
