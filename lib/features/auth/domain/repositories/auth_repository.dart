import 'package:architecture_proposal/features/auth/domain/entities/login_failures.dart';
import 'package:architecture_proposal/features/auth/domain/entities/user.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  ///Login with userName and password.
  ///Some people prefer to pass in a class with access settings instead of the username and password directly here
  Future<Either<LoginFailure, User>> login(
      {required String userName, required String password});
}
