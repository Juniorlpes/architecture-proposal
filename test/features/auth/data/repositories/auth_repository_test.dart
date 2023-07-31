import 'package:flutter_test/flutter_test.dart';
import 'package:architecture_proposal/features/auth/data/datasources/auth_datasource.dart';
import 'package:architecture_proposal/features/auth/data/models/user_model.dart';
import 'package:architecture_proposal/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:architecture_proposal/features/auth/domain/entities/login_failures.dart';
import 'package:architecture_proposal/features/auth/domain/repositories/auth_repository.dart';

class AuthDatasourceMock implements AuthDatasource {
  @override
  Future<UserModel> login(
      {required String userName, required String password}) async {
    if (!userName.contains('bento')) {
      throw UnknownEmailOrPassword(); //Or a LoginFailure
    }
    return UserModel(userName: 'Bento');
  }
}

void main() {
  final _authDatacource = AuthDatasourceMock();
  AuthRepository authRepository = AuthRepositoryImpl(_authDatacource);

  group('AuthRepository Tests', () {
    test('instance', () {
      expect(authRepository, isA<AuthRepository>());
    });

    test('right case', () async {
      final result = await authRepository.login(
          userName: 'bento@test.com', password: '123456');

      expect(result.isRight(), true);
    });

    test('error case', () async {
      final result = await authRepository.login(
          userName: 'other@test.com', password: '123456');

      expect(result.isRight(), false);
      expect(result.isLeft(), true);

      LoginFailure? failure = result.fold((l) => l, (r) => null);
      expect(failure, isA<UnknownEmailOrPassword>());
    });
  });
}
