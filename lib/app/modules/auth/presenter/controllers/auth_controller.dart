import 'package:architecture_proposal/app/modules/auth/domain/entities/login_failures.dart';
import 'package:architecture_proposal/app/modules/auth/domain/entities/user.dart';
import 'package:architecture_proposal/app/modules/auth/domain/usecases/login.dart';
import 'package:architecture_proposal/shared/enums/request_status.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'auth_controller.g.dart';

@Injectable()
class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase with Store {
  final Login _login;

  _AuthControllerBase(this._login);

  @observable
  var loginStatus = RequestStatus.None;

  LoginFailure? loginFailure;
  User? user;

  @action
  Future<void> login({required String email, required String password}) async {
    loginStatus = RequestStatus.Loading;

    final result = await _login(email: email, password: password);
    result.fold(
      (failure) {
        loginStatus = RequestStatus.Fail;
        loginFailure = failure;
      },
      (data) {
        loginStatus = RequestStatus.Success;
        user = data;
      },
    );
  }
}
