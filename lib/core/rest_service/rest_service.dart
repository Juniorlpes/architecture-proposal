import 'package:architecture_proposal/shared/entities/general_app_failure.dart';

class WebResponse<T> {
  late T data;
  GeneralAppFailure? failure;

  int? statusCode; //if you are using http service

  bool get success => failure == null;
}

///This class has all operations you need to do in your webservice.
///This is importante because it will know your external package (http, dio, firebase, etc) and your application will know this class.
///If you need change your external package, service or protocol, you'll only change this class.
///You must adapt this class to your necessity/reality
abstract class RestService {
  //Get a model from webService
  Future<WebResponse<T>> getModel<T>(
    String path,
    T Function(Map<String, dynamic> json) parse, {
    //usually this dynamic will be a Map<String, dynamic>?
    Map<String, dynamic>? query, //if you are using http service
  });

  //Get a list model from webService
  Future<WebResponse<List<T>>> getList<T>(
      String path, T Function(Map<String, dynamic> json) parse);

  //Post a data and receive a model
  Future<WebResponse<T>> postModel<T>(
      String path, dynamic body, T Function(Map<String, dynamic> json) parse);

  //Post a data and receive a list model
  Future<WebResponse<List<T>>> postList<T>(
      String path, dynamic body, T Function(Map<String, dynamic> json) parse);
}
