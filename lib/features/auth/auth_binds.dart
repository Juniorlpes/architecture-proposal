import 'package:architecture_proposal/core/rest_service/rest_service_impl.dart';
import 'package:architecture_proposal/features/auth/data/datasources/auth_datasource.dart';
import 'package:architecture_proposal/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:architecture_proposal/features/auth/domain/repositories/auth_repository.dart';
import 'package:architecture_proposal/features/auth/domain/usecases/login.dart';

///Here I just show the dependency injection.
///This module/feature will use the Login (Usecase/method) where the dependency was injected.
///It might just be a function to initialize all dependencies
class AuthBinds {
  late final AuthDatasource _authDatasource;
  late final AuthRepository _authRepository;
  late final Login _loginUsecase;

  AuthBinds() {
    _authDatasource = AuthDatasourceImpl(RestServiceImpl());
    _authRepository = AuthRepositoryImpl(_authDatasource);
    _loginUsecase = LoginImpl(_authRepository);
  }

  Login get loginUsecase => _loginUsecase;
}
