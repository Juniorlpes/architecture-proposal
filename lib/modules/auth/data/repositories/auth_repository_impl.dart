import 'package:architecture_proposal/modules/auth/data/datasources/auth_datasource.dart';
import 'package:architecture_proposal/modules/auth/domain/entities/user.dart';
import 'package:architecture_proposal/modules/auth/domain/entities/login_failures.dart';
import 'package:architecture_proposal/modules/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDatasource _datasource;

  AuthRepositoryImpl(this._datasource);

  @override
  Future<Either<LoginFailure, User>> login(
      {required String email, required String password}) async {
    try {
      final user = await _datasource.login(email: email, password: password);
      return right(user);
    } catch (e) {
      return left(e as LoginFailure);
    }
  }
}
