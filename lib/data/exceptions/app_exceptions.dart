class AppException implements Exception {
  final String? _message;
  final String? _prefix;
  AppException([this._message, this._prefix]);
  @override
  String toString() {
    return '$_prefix$_message';
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message])
    : super(message, 'Error During Communication');
}

class BadRequestException extends AppException {
  BadRequestException([String? message]) : super(message, 'Invalid request');
}

class ApiException extends AppException {
  ApiException([String? message]) : super(message, '');
}

class UnauthorisedException extends AppException {
  UnauthorisedException([String? message])
    : super(message, 'Unauthorised request');
}

class InvalidInputException extends AppException {
  InvalidInputException([String? message]) : super(message, 'Invalid Input');
}

class InternetException extends AppException {
  InternetException([String? message]) : super(message, '');
}

class RequestTimeOut extends AppException {
  RequestTimeOut([String? message]) : super(message, 'Request Time out');
}

class UnknownException extends AppException {
  UnknownException([String? message]) : super(message, "");
}

class RequestCancelledException extends AppException {
  RequestCancelledException([String? message]) : super(message, "");
}

class ServerException extends AppException {
  ServerException([String? message]) : super(message, "");
}
