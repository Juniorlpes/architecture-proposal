import 'package:architecture_proposal/modules/auth/domain/entities/login_failures.dart';
import 'package:architecture_proposal/modules/auth/domain/entities/user.dart';
import 'package:architecture_proposal/modules/auth/domain/repositories/login_repository.dart';
import 'package:dartz/dartz.dart';

abstract class ILogin {
  Future<Either<LoginFailure, User>> call({
    required String email,
    required String password,
  });
}

class Login implements ILogin {
  final ILoginRepository _loginRepository;

  Login(this._loginRepository);

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
