import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_exception.freezed.dart';

@freezed
class AppException with _$AppException {
  const AppException._();
  const factory AppException.requestCancelled() = _RequestCancelled;
  const factory AppException.connectTimeout() = _ConnectTimeout;
  const factory AppException.receiveTimeout() = _ReceiveTimeout;
  const factory AppException.sendTimeout() = _SendTimeout;

  const factory AppException.badRequest() = _BadRequest;
  const factory AppException.unAuthorizedRequest() = _UnAuthorizedRequest;
  const factory AppException.requestNotFound() = _RequestNotFound;
  const factory AppException.internalServerError() = _InternalServerError;
  const factory AppException.unexpectedError() = _UnexpectedError;
  const factory AppException.defaultError(String error) = _DefaultError;
  const factory AppException.networkError() = _NetworkError;
  const factory AppException.serializationError() = _SerializationError;

  factory AppException.getDioException(DioError error) {
    switch (error.type) {
      case DioErrorType.cancel:
        return const AppException.requestCancelled();
      case DioErrorType.connectTimeout:
        return const AppException.connectTimeout();
      case DioErrorType.sendTimeout:
        return const AppException.sendTimeout();
      case DioErrorType.receiveTimeout:
        return const AppException.sendTimeout();
      case DioErrorType.response:
        switch (error.response!.statusCode) {
          case 400:
            return const AppException.badRequest();
          case 401:
            return const AppException.unAuthorizedRequest();
          case 404:
            return const AppException.requestNotFound();
          case 500:
            return const AppException.internalServerError();
          default:
            final responseCode = error.response!.statusCode;
            return AppException.defaultError(
              "Received invalid status code: $responseCode",
            );
        }
      default:
        return const AppException.unexpectedError();
    }
  }

  String get msg => when(
        requestCancelled: () => "Request to server was cancelled",
        connectTimeout: () => "Connection to server timed out",
        receiveTimeout: () => "Receive timeout in connection with server",
        sendTimeout: () => "Send timeout in connection with server",
        badRequest: () => "Error:400 Bad request",
        unAuthorizedRequest: () => "Error:401 Invalid api key",
        requestNotFound: () => "Error:404 Request not found",
        internalServerError: () => "Error:500 Internal server error",
        unexpectedError: () => "Error: Something went wrong",
        defaultError: (ex) => "Api Error occurred: $ex",
        networkError: () => "Internet is unavailable",
        serializationError: () => "Serialization Error",
      );
}
