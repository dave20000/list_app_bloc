import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'response/base_response.dart';
import '../device_services/connectivity_service.dart';
import 'mappers/to_json.dart';
import 'response/api_response.dart';
import '../error/app_exception.dart';
import '../app_serializers.dart';

@singleton
class ApiManager {
  late Dio _dio;

  ApiManager() {
    final BaseOptions options = BaseOptions(
      baseUrl: "https://the-one-api.dev/v2/",
      connectTimeout: 50000,
      receiveTimeout: 50000,
    );
    _dio = Dio(options);
  }

  Map<String, dynamic> _generateHeaders(Map<String, dynamic>? headers) {
    final Map<String, dynamic> headersMap = {};
    headersMap[HttpHeaders.contentTypeHeader] = "application/json";
    headersMap[HttpHeaders.authorizationHeader] = "Bearer vbFmnb_TMuaJaM9-1Efp";
    if (headers != null) {
      headersMap.addAll(headers);
    }
    return headersMap;
  }

  Future<ApiResponse<BaseResponse<T>>> getAsync<T extends ToJson>({
    required String endpoint,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
  }) async {
    try {
      if (await ConnectivityService.hasConnection()) {
        final response = await _dio.get(
          endpoint,
          queryParameters: queryParams,
          options: Options(
            headers: _generateHeaders(headers),
          ),
          cancelToken: cancelToken,
        );
        if (AppSerializers.serializers[T] != null) {
          return ApiResponse<BaseResponse<T>>.success(
            BaseResponse.fromJson(response.data as Map<String, dynamic>),
          );
        } else {
          return const ApiResponse.error(
            AppException.serializationError(),
          );
        }
      } else {
        throw const AppException.networkError();
      }
    } on DioError catch (error) {
      return ApiResponse.error(
        AppException.getDioException(error),
      );
    } catch (ex) {
      return ApiResponse.error(
        AppException.defaultError(ex.toString()),
      );
    }
  }
}
