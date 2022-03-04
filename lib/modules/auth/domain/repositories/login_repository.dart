import 'package:architecture_proposal/modules/auth/domain/entities/login_failures.dart';
import 'package:architecture_proposal/modules/auth/domain/entities/user.dart';
import 'package:dartz/dartz.dart';

abstract class ILoginRepository {
  Future<Either<LoginFailure, User>> login(
      {required String email, required String password});
}
