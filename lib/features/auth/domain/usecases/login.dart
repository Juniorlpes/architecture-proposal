import 'package:architecture_proposal/features/auth/domain/entities/login_failures.dart';
import 'package:architecture_proposal/features/auth/domain/entities/user.dart';
import 'package:architecture_proposal/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

abstract class Login {
  Future<Either<LoginFailure, User>> call({
    required String email,
    required String password,
  });
}

class LoginImpl implements Login {
  final AuthRepository _loginRepository;

  LoginImpl(this._loginRepository);

  @override
  Future<Either<LoginFailure, User>> call({
    required String email,
    required String password,
  }) async {
    if (email.isEmpty) {
      return left(InvalidEmail(message: 'email cannot be empty'));
    } else if (password.isEmpty) {
      return left(InvalidPassword(message: 'password cannot be empty'));
    } else if (password.length < 5) {
      return left(InvalidPassword(message: 'short password'));
    } else if (!email.endsWith('.com')) {
      //Example rule, could be a real validator
      return left(InvalidEmail());
    }
    return await _loginRepository.login(email: email, password: password);
  }
}
