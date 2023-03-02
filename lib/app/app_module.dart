import 'package:architecture_proposal/app/modules/auth/auth_module.dart';
import 'package:architecture_proposal/core/rest_service/rest_service_impl.dart';
import 'package:dio/dio.dart';

import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind(
          (i) => RestServiceImpl(
            Dio(BaseOptions(
              baseUrl: 'http://www.base-url.com',
            ))
              ..interceptors.add(
                Interceptor(),
              ),
          ),
        ),
        Bind((i) => AppController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/auth', module: AuthModule()),
      ];
}
