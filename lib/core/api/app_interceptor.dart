import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AppInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Content-Type'] = 'application/json';
    options.headers['X-Api-Key'] = 'MOazYgpQHn5En2Nxf+/aEA==SWQa0nuTmbVLn8oV';

    debugPrint('REQUEST[${options.method}] => PATH: ${options.path}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint(
        'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    super.onResponse(response, handler);
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    debugPrint(
        'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    super.onError(err, handler);
  }
}


  // 'Content-Type': 'application/json',
  //   'X-Api-Key': 'MOazYgpQHn5En2Nxf+/aEA==SWQa0nuTmbVLn8oV',