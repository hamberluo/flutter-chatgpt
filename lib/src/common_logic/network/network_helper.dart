import 'dart:async';

import 'package:dio/dio.dart';
import 'package:dio_http_formatter/dio_http_formatter.dart';

typedef Parser<T> = T Function(Map<String, dynamic>);

class NetworkHelper {
  NetworkHelper({
    required this.baseUrl,
    this.contentType = 'application/json',
    this.headers,
  }) : dio = Dio(
          BaseOptions(
            baseUrl: baseUrl,
            headers: headers,
            contentType: contentType,
            sendTimeout: const Duration(seconds: 10),
            receiveTimeout: const Duration(seconds: 10),
            connectTimeout: const Duration(seconds: 10),
          ),
        )..interceptors.add(HttpFormatter());
  final String baseUrl;
  final String contentType;
  final Map<String, dynamic>? headers;
  final Dio dio;

  Future<T> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    required Parser<T> parser,
  }) async {
    try {
      final options = Options(
        headers: headers ?? this.headers,
      );
      final response = await dio.get<dynamic>(
        path,
        queryParameters: queryParameters,
        options: options,
      );
      return parser.call(response.data as Map<String, dynamic>);
    } on DioError catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  Future<T> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? headers,
    required Parser<T> parser,
  }) async {
    try {
      final options = Options(
        headers: headers ?? this.headers,
      );
      final response = await dio.post<dynamic>(
        path,
        data: data,
        options: options,
      );
      return parser.call(response.data as Map<String, dynamic>);
    } on DioError catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  Future<T> put<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? headers,
    required Parser<T> parser,
  }) async {
    try {
      final options = Options(
        headers: headers ?? this.headers,
      );
      final response = await dio.put<dynamic>(
        path,
        data: data,
        options: options,
      );
      return parser.call(response.data as Map<String, dynamic>);
    } on DioError catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  Future<T> delete<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? headers,
    required Parser<T> parser,
  }) async {
    try {
      final options = Options(
        headers: headers ?? this.headers,
      );
      final response = await dio.delete<dynamic>(
        path,
        data: data,
        options: options,
      );
      return parser.call(response.data as Map<String, dynamic>);
    } on DioError catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  void _handleError(DioError e) {
    if (e.type == DioErrorType.connectionTimeout ||
        e.type == DioErrorType.receiveTimeout ||
        e.type == DioErrorType.sendTimeout) {
      throw TimeoutException('Connection Timeout');
    } else if (e.type == DioErrorType.cancel) {
      throw Exception('Request Cancelled');
    } else {
      var errorMessage = 'Unexpected Error Occurred';
      if (e.response?.data != null) {
        errorMessage = e.response!.data.toString();
      } else if (e.message != null) {
        errorMessage = e.message!;
      }
      throw Exception(errorMessage);
    }
  }
}
