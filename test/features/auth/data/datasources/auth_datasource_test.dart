import 'package:architecture_proposal/core/rest_service/rest_service.dart';
import 'package:architecture_proposal/features/auth/data/datasources/auth_datasource.dart';
import 'package:architecture_proposal/shared/entities/general_app_failure.dart';
import 'package:flutter_test/flutter_test.dart';

class WebServiceMock implements RestService {
  @override
  Future<WebResponse<List<T>>> getList<T>(
      String path, T Function(Map<String, dynamic> json) parse) async {
    return WebResponse<List<T>>()
      ..failure = GeneralAppFailure(message: 'Unimplemented');
  }

  @override
  Future<WebResponse<T>> getModel<T>(
      String path, T Function(Map<String, dynamic> json) parse,
      {Map<String, dynamic>? query}) async {
    return WebResponse<T>()
      ..failure = GeneralAppFailure(message: 'Unimplemented');
  }

  @override
  Future<WebResponse<List<T>>> postList<T>(
      String path, body, T Function(Map<String, dynamic> json) parse) async {
    return WebResponse<List<T>>()
      ..failure = GeneralAppFailure(message: 'Unimplemented');
  }

  @override
  Future<WebResponse<T>> postModel<T>(
      String path, body, T Function(Map<String, dynamic> json) parse) async {
    if (path == 'api/login') {
      //real json web response simulation
      return WebResponse<T>()..data = parse({'userName': 'bento2@test.com'});
    }
    return WebResponse<T>()
      ..failure = GeneralAppFailure(message: 'Unimplemented');
  }
}

void main() {
  final webServiceMock = WebServiceMock();
  AuthDatasource datasource = AuthDatasourceImpl(webServiceMock);

  group('AuthDatasource Tests', () {
    test('right case', () async {
      final result = await datasource.login(
          userName: 'bento@test.com', password: '123456');

      expect(result.userName, 'bento2@test.com');
    });

    test('error case', () async {
      //
    });
  });
}
