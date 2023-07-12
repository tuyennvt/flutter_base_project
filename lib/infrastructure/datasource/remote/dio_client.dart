import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../application/core/app_constants.dart';
import 'dio_client_exception.dart';
import 'interceptors/auth_interceptor.dart';
import 'interceptors/logger_interceptor.dart';

final dioClientProvider = Provider<DioClient>((ref) {
  return DioClient();
});

class DioClient {
  DioClient() {
    _dio = Dio();
    _dio?.options.baseUrl = AppConstants.baseUrl;
    _dio?.options.connectTimeout = const Duration(seconds: 60);
    _dio?.options.receiveTimeout = const Duration(seconds: 60);
    _dio?.interceptors.addAll(
      [
        AuthInterceptor(),
        LoggerInterceptor(),
      ],
    );
  }

  Dio? _dio;

  Future<dynamic> post({
    String path = '',
    Map<String, dynamic> data = const {},
  }) async {
    try {
      final Response? response = await _dio?.post(
        path,
        data: data,
      );
      return response?.data;
    } on DioException catch (dioException) {
      throw DioClientException.fromException(dioException).toString();
    } catch (error) {
      rethrow;
    }
  }

  Future<dynamic> get({
    String path = '',
    Map<String, dynamic> queryParameters = const {},
  }) async {
    try {
      final Response? response = await _dio?.get(
        path,
        queryParameters: queryParameters,
      );
      return response?.data;
    } on DioException catch (dioException) {
      throw DioClientException.fromException(dioException).toString();
    } catch (error) {
      rethrow;
    }
  }
}
