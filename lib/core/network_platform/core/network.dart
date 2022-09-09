import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_movie_provider_archs/core/core.dart';
import 'nw_core.dart';

typedef JsonToModelHandle<T> = Result<T, Exception> Function(
    Map<String, dynamic>);

class Network<T> {
  late Dio _dio;

  Network() {
    BaseOptions baseOptions = BaseOptions();
    baseOptions.headers = {'Content-Type': 'application/json'};
    baseOptions.connectTimeout = 60 * 1000;
    baseOptions.receiveTimeout = 60 * 1000;
    if (!kReleaseMode) {
      _dio.interceptors
          .add(LogInterceptor(requestBody: true, responseBody: true));
    }
    _dio = Dio(baseOptions);
  }

  Future<void> execute(
      UrlRequestConvertible request, JsonToModelHandle<T> handler) async {
    _dio.options.baseUrl = request.baseUrl();
    Options options =
        Options(method: request.apiMethod().name, headers: request.headers());
    Response response = await _dio.request(request.path(),
        data: request.body(), options: options);
  }
}
