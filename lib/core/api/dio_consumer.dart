import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';

import 'package:quote/core/api/api_consumer.dart';
import 'package:quote/core/api/status_code.dart';
import 'package:quote/injection_container.dart' as di;

import '../error/exceptions.dart';
import 'app_interceptor.dart';
import 'end_points.dart';

class DioConsumer implements ApiConsumer {
  final Dio client;
  DioConsumer({
    required this.client,
  }) {
    (client.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
      return HttpClient()
        ..badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
    };

    client.options
      ..baseUrl = EndPoints.baseUrl
      ..connectTimeout = const Duration(seconds: 5)
      ..receiveTimeout = const Duration(seconds: 5)
      ..responseType = ResponseType.plain
      ..followRedirects = false
      ..validateStatus = (status) {
        return status! < StatusCode.internalServerFailure;
      };
    client.interceptors.add(di.sl<AppInterceptors>());
    client.interceptors.add(di.sl<LogInterceptor>());
  }

  @override
  Future get(String path, {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await client.get(path, queryParameters: queryParameters);
      return jsonDecode(response.data.toString());
    } on DioException catch (error) {
      _handleDioError(error);
    }
  }

  @override
  Future post(String path,
      {Map<String, dynamic>? body,
      Map<String, dynamic>? queryParameters}) async {
    try {
      final response =
          await client.post(path, queryParameters: queryParameters, data: body);
      return jsonDecode(response.data.toString());
    } on DioException catch (error) {
      _handleDioError(error);
    }
  }

  @override
  Future put(String path,
      {Map<String, dynamic>? body,
      Map<String, dynamic>? queryParameters}) async {
    final response =
        await client.put(path, queryParameters: queryParameters, data: body);
    return jsonDecode(response.data.toString());
  }

  dynamic _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        throw const FetchDataException();
      case DioExceptionType.badResponse:
        switch (error.response?.statusCode) {
          case StatusCode.badRequest:
            throw const BadRequestException();
          case StatusCode.unauthorized:
          case StatusCode.forbidden:
            throw const UnauthorizedException();
          case StatusCode.notFound:
            throw const NotFoundException();
          case StatusCode.conflict:
            throw const ConflictException();
          case StatusCode.internalServerFailure:
            throw const InternalServerErrorException();
        }
      case DioExceptionType.cancel:
        break;
      case DioExceptionType.unknown:
        throw const NoInternetConnectionException();

      default:
        break;
    }
  }
}
