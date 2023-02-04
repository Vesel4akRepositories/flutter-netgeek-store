import 'package:dio/dio.dart';
import 'package:netgeek/core/util/exceptions/exceptions.dart';

class ExceptionHandler {
  static Exception handleError(dynamic error) {
    if (error is DioError) {
      return NetworkException.fromDioError(error);
    }

    return UnknownException();
  }
}
