import 'package:architecture_proposal/core/rest_service/rest_service.dart';
import 'package:architecture_proposal/shared/entities/general_app_failure.dart';

///A better example in real-world branch
class RestServiceImpl implements RestService {
  //Dio dio.... (example external service)

  //In a real project, here would have a try catch to return a complet WebResponse with the "right" error
  @override
  Future<WebResponse<List<T>>> getList<T>(
      String path, T Function(Map<String, dynamic> json) parse) async {
    await Future.delayed(Duration(seconds: 1));
    return WebResponse<List<T>>()
      ..failure = GeneralAppFailure(message: 'Unimplemented');
  }

  @override
  Future<WebResponse<T>> getModel<T>(
      String path, T Function(Map<String, dynamic> json) parse,
      {Map<String, dynamic>? query}) async {
    await Future.delayed(Duration(seconds: 1));
    return WebResponse<T>()
      ..failure = GeneralAppFailure(message: 'Unimplemented');
  }

  @override
  Future<WebResponse<List<T>>> postList<T>(
      String path, body, T Function(Map<String, dynamic> json) parse) async {
    await Future.delayed(Duration(seconds: 1));
    return WebResponse<List<T>>()
      ..failure = GeneralAppFailure(message: 'Unimplemented');
  }

  @override
  Future<WebResponse<T>> postModel<T>(
      String path, body, T Function(Map<String, dynamic> json) parse) async {
    await Future.delayed(Duration(seconds: 1));
    return WebResponse<T>()
      ..failure = GeneralAppFailure(message: 'Unimplemented');
  }
}
