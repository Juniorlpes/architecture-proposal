import 'package:architecture_proposal/features/auth/data/datasources/auth_datasource.dart';
import 'package:architecture_proposal/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:architecture_proposal/features/auth/domain/repositories/auth_repository.dart';
import 'package:architecture_proposal/features/auth/domain/usecases/login.dart';
import 'package:architecture_proposal/shared/data/web_service_impl.dart';

class AuthBinds {
  AuthBinds._() {
    _authDatasource = AuthDatasourceImpl(WebServiceImpl());
    _authRepository = AuthRepositoryImpl(_authDatasource);
    loginUsecase = LoginImpl(_authRepository);
  }
  static final AuthBinds instance = AuthBinds._();
  factory AuthBinds() => instance;

  late final AuthDatasource _authDatasource;
  late final AuthRepository _authRepository;
  late final Login loginUsecase;
}
