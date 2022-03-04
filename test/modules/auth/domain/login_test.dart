import 'package:architecture_proposal/modules/auth/domain/entities/user.dart';
import 'package:architecture_proposal/modules/auth/domain/entities/login_failures.dart';
import 'package:architecture_proposal/modules/auth/domain/repositories/login_repository.dart';
import 'package:architecture_proposal/modules/auth/domain/usecases/login.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

class LoginRepositoryMock implements ILoginRepository {
  @override
  Future<Either<LoginFailure, User>> login(
      {required String email, required String password}) async {
    return right(User(name: 'Peter', email: 'peter@test.com'));
  }
}

void main() {
  final ILoginRepository repository = LoginRepositoryMock();
  final login = Login(repository);

  test('Login successfully', () async {
    var result = await login(email: 'email@test.com', password: '12345');

    expect(result.isRight(), true);
  });

  test('Invalid email', () async {
    var result = await login(email: 'email@test', password: '12345');

    expect(result.isRight(), false);
    expect(result.fold((l) => l, (r) => r), isA<InvalidEmail>());

    result = await login(email: '', password: '12345');

    expect(result.isRight(), false);
    expect(result.fold((l) => l, (r) => r), isA<InvalidEmail>());
  });

  test('Invalid password', () async {
    var result = await login(email: 'email@test.com', password: '123');

    expect(result.isRight(), false);
    expect(result.fold((l) => l, (r) => r), isA<InvalidPassword>());

    result = await login(email: 'email@test.com', password: '');

    expect(result.isRight(), false);
    expect(result.fold((l) => l, (r) => r), isA<InvalidPassword>());
  });
}
