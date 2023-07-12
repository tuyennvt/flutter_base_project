import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';

class LoggerInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log(
      'Error: ${err.error}, Message: ${err.message}',
      name: 'LoggerInterceptor.onError',
    );
    return super.onError(err, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log(
      'StatusCode: ${response.statusCode}, Data: ${jsonEncode(response.data)}',
      name: 'LoggerInterceptor.onResponse',
    );
    return super.onResponse(response, handler);
  }
}
