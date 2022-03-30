import 'package:architecture_proposal/features/auth/data/datasources/auth_datasource.dart';
import 'package:architecture_proposal/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:architecture_proposal/features/auth/domain/repositories/auth_repository.dart';
import 'package:architecture_proposal/features/auth/domain/usecases/login.dart';
import 'package:architecture_proposal/shared/data/web_service_impl.dart';

class AuthBinds {
  late final AuthDatasource _authDatasource;
  late final AuthRepository _authRepository;
  late final Login _loginUsecase;

  AuthBinds() {
    _authDatasource = AuthDatasourceImpl(WebServiceImpl());
    _authRepository = AuthRepositoryImpl(_authDatasource);
    _loginUsecase = LoginImpl(_authRepository);
  }

  Login get loginUsecase => _loginUsecase;
}
