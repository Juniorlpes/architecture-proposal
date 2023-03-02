import 'package:architecture_proposal/core/rest_service/rest_service.dart';
import 'package:architecture_proposal/features/auth/data/models/user_model.dart';
import 'package:architecture_proposal/features/auth/domain/entities/login_failures.dart';

abstract class AuthDatasource {
  Future<UserModel> login({required String email, required String password});
}

class AuthDatasourceImpl implements AuthDatasource {
  final RestService _webService;

  AuthDatasourceImpl(this._webService);

  @override
  Future<UserModel> login(
      {required String email, required String password}) async {
    final result = await _webService.postModel<UserModel>(
      'api/login',
      {
        'email': email,
        'password': password,
      },
      (data) => UserModel.fromJson(data),
    );

    if (result.success) {
      return result.data;
    } else {
      throw LoginFailure()
        ..message = result.failure?.message
        ..requestErrors = result.failure?.requestErrors;
      //request errors (status code) could be inputed here or in webservice
      //here you can analyze de status code or requestErrors to throw a specific errors on domain/entities/login_failures.dart
    }
  }
}
