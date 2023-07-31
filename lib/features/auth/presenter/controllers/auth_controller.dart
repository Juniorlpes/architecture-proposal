import 'package:architecture_proposal/features/auth/domain/entities/login_failures.dart';
import 'package:architecture_proposal/features/auth/domain/entities/user.dart';
import 'package:architecture_proposal/features/auth/domain/usecases/login.dart';
import 'package:architecture_proposal/shared/enums/request_status.dart';
import 'package:flutter/material.dart';

class AuthController extends ChangeNotifier {
  final Login _login;

  AuthController(this._login);

  var loginStatus = RequestStatus.None;

  LoginFailure? loginFailure;
  User? user;

  Future<void> login(
      {required String userName, required String password}) async {
    loginStatus = RequestStatus.Loading;
    notifyListeners();

    final result = await _login(userName: userName, password: password);
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
