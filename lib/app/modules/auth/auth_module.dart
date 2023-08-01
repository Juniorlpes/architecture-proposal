import 'package:architecture_proposal/app/modules/auth/data/datasources/auth_datasource.dart';
import 'package:architecture_proposal/app/modules/auth/data/repositories/auth_repository_impl.dart';
import 'package:architecture_proposal/app/modules/auth/domain/usecases/login.dart';
import 'package:architecture_proposal/app/modules/auth/presenter/pages/auth_page.dart';

import 'presenter/controllers/auth_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => AuthDatasourceImpl(i())),
        Bind((i) => AuthRepositoryImpl(i())),
        Bind((i) => LoginImpl(i())),
        Bind((i) => AuthStore(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute, child: (_, args) => AuthPage()),
      ];
}
