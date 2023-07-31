import 'package:architecture_proposal/features/auth/data/datasources/auth_datasource.dart';
import 'package:architecture_proposal/features/auth/domain/entities/user.dart';
import 'package:architecture_proposal/features/auth/domain/entities/login_failures.dart';
import 'package:architecture_proposal/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDatasource _datasource;

  AuthRepositoryImpl(this._datasource);

  @override
  Future<Either<LoginFailure, User>> login(
      {required String userName, required String password}) async {
    try {
      final user =
          await _datasource.login(userName: userName, password: password);
      return right(user);
    } catch (e) {
      return left(e as LoginFailure);
    }
  }
}
