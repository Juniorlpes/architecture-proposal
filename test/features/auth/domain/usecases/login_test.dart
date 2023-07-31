import 'package:architecture_proposal/features/auth/domain/entities/enums/type_user.dart';
import 'package:architecture_proposal/features/auth/domain/entities/user.dart';
import 'package:architecture_proposal/features/auth/domain/entities/login_failures.dart';
import 'package:architecture_proposal/features/auth/domain/repositories/auth_repository.dart';
import 'package:architecture_proposal/features/auth/domain/usecases/login.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

class LoginRepositoryMock implements AuthRepository {
  @override
  Future<Either<LoginFailure, User>> login(
      {required String userName, required String password}) async {
    return right(User(userName: userName, typeUser: TypeUser.Common));
  }
}

void main() {
  final AuthRepository repository = LoginRepositoryMock();
  final login = LoginImpl(repository);

  test('Login successfully', () async {
    var result = await login(userName: 'email@test.com', password: '12345');

    expect(result.isRight(), true);
    User? user = result.fold((l) => null, id); //id = (r) => r
    expect(user?.userName, 'email@test.com');
  });

  test('Invalid email', () async {
    var result = await login(userName: 'email@test', password: '12345');

    expect(result.isRight(), false);
    expect(result.fold((l) => l, (r) => r), isA<InvalidUserName>());

    result = await login(userName: '', password: '12345');

    expect(result.isRight(), false);
    expect(result.fold((l) => l, (r) => r), isA<InvalidUserName>());
  });

  test('Invalid password', () async {
    var result = await login(userName: 'email@test.com', password: '123');

    expect(result.isRight(), false);
    expect(result.fold((l) => l, (r) => r), isA<InvalidPassword>());

    result = await login(userName: 'email@test.com', password: '');

    expect(result.isRight(), false);
    expect(result.fold((l) => l, (r) => r), isA<InvalidPassword>());
  });
}
