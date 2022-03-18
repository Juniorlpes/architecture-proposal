import 'package:architecture_proposal/features/auth/domain/entities/login_failures.dart';
import 'package:architecture_proposal/features/auth/domain/entities/user.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<LoginFailure, User>> login(
      {required String email, required String password});
}
