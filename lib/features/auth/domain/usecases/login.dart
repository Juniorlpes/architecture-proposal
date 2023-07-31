import 'package:architecture_proposal/features/auth/domain/entities/login_failures.dart';
import 'package:architecture_proposal/features/auth/domain/entities/user.dart';
import 'package:architecture_proposal/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

abstract class Login {
  Future<Either<LoginFailure, User>> call({
    required String userName,
    required String password,
  });
}

class LoginImpl implements Login {
  final AuthRepository _loginRepository;

  LoginImpl(this._loginRepository);

  @override
  Future<Either<LoginFailure, User>> call({
    required String userName,
    required String password,
  }) async {
    //I put this here to show some examples of checking business rules
    if (userName.isEmpty) {
      return left(InvalidUserName(message: 'userName cannot be empty'));
    } else if (password.isEmpty) {
      return left(InvalidPassword(message: 'password cannot be empty'));
    } else if (password.length < 5) {
      return left(InvalidPassword(message: 'short password'));
    }
    return await _loginRepository.login(userName: userName, password: password);
  }
}
