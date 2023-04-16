import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:movieapp/utils/constants.dart';

class ApiUtil {
  late Dio _dio;

  ApiUtil._();

  static ApiUtil? _instance;

  static ApiUtil get instance => _instance ??= ApiUtil._();

  init() {
    _dio = Dio(
      BaseOptions(
        baseUrl: Constants.baseUrl,
        connectTimeout: const Duration(seconds: 10),
        queryParameters: {"api_key": Constants.apiKey, "language": "en-US"},
        contentType: 'application/json',
      ),
    );
  }

  Future<dynamic> get({
    required String path,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      Response response = await _dio.get(
        path,
        options: Options(headers: headers),
        queryParameters: queryParameters,
      );
      return response.data;
    } catch (err) {
      rethrow;
    }
  }
}
