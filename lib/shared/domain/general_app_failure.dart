//Commoms errors on API services
enum RequestErrors { ServerError, ConnectionError, Unauthorized, NotFound }

///This class has commoms API services errors to avoid repetition on modules failures
class GeneralAppFailure implements Exception {
  String? message;
  RequestErrors? requestErrors;

  GeneralAppFailure({this.message, this.requestErrors});

  bool get hasRequestErrors => requestErrors != null;
}
