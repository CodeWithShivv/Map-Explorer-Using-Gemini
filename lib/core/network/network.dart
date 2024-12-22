import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';

class DioClient {
  final Dio _dio;

  DioClient._internal(this._dio);

  static final DioClient _instance = DioClient._internal(
    Dio(),
  );

  factory DioClient() => _instance;

  void setHeaders(Map<String, String> headers) {
    _dio.options.headers.addAll(headers);
  }

  /// GET Request
  Future<dynamic> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.get(
        endpoint,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response.data;
    } on DioException catch (e) {
      throw Exception('Error: $e');
    }
  }

  /// POST Request
  Future<dynamic> post(
    String endpoint, {
    Map<String, dynamic>? data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.post(
        endpoint,
        data: jsonEncode(data),
        options: options,
        cancelToken: cancelToken,
      );
      return response.data;
    } on DioException catch (e) {
      throw Exception('Error: $e');
    }
  }

  /// PUT Request
  Future<dynamic> put(
    String endpoint, {
    Map<String, dynamic>? data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.put(
        endpoint,
        data: jsonEncode(data),
        options: options,
        cancelToken: cancelToken,
      );
      return response.data;
    } on DioException catch (e) {
      throw Exception('Error: $e');
    }
  }

  /// DELETE Request
  Future<dynamic> delete(
    String endpoint, {
    Map<String, dynamic>? data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.delete(
        endpoint,
        data: jsonEncode(data),
        options: options,
        cancelToken: cancelToken,
      );
      return response.data;
    } on DioException catch (e) {
      throw Exception('Error: $e');
    }
  }
}
