import 'package:dio/dio.dart';

class NetworkException implements Exception {
  NetworkException();

  NetworkException.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.cancel:
        message = "Request to API server was cancelled";
        break;
      case DioErrorType.connectTimeout:
        message = "Connection timeout with API server";
        break;
      case DioErrorType.receiveTimeout:
        message = "Receive timeout in connection with API server";
        break;
      case DioErrorType.other:
        message = "Please, check your internet connection";
        break;
      case DioErrorType.response:
        _handleError(dioError.response);
        break;
      case DioErrorType.sendTimeout:
        message = "Send timeout in connection with API server";
        break;
      default:
        message = "Something went wrong";
        break;
    }
  }

  String? message;

  void _handleError(Response? response) {
    if (response?.statusCode == 401) {
      message = 'Срок действия сессии истек. Пожалуйста, выполните повторный вход в свой аккаунт';
    } else {
      message = response?.data['msg'];
    }
  }

  @override
  String toString() => message ?? '';
}
