import 'package:architecture_proposal/modules/auth/domain/entities/login_failures.dart';
import 'package:architecture_proposal/modules/auth/domain/entities/user.dart';
import 'package:architecture_proposal/modules/auth/domain/usecases/login.dart';
import 'package:architecture_proposal/shared/domain/request_status.dart';
import 'package:flutter/material.dart';

class AuthController extends ChangeNotifier {
  final Login _login;

  AuthController(this._login);

  var loginStatus = RequestStatus.None;

  LoginFailure? loginFailure;
  User? user;

  Future<void> login({required String email, required String password}) async {
    loginStatus = RequestStatus.Loading;
    notifyListeners();

    final result = await _login(email: email, password: password);
    result.fold(
      (failure) {
        loginStatus = RequestStatus.Fail;
        loginFailure = failure;
        notifyListeners();
      },
      (data) {
        loginStatus = RequestStatus.Success;
        user = data;
        notifyListeners();
      },
    );
  }
}
