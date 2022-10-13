import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_movie_provider_archs/core/core.dart';
import 'package:flutter_pretty_dio_logger/flutter_pretty_dio_logger.dart';

typedef JsonToModelHandle<T> = T Function(Map<String, dynamic>);

class Network<T> {
  late Dio _dio;

  Network() {
    BaseOptions baseOptions = BaseOptions();
    baseOptions.headers = {'Content-Type': 'application/json'};
    baseOptions.connectTimeout = 60 * 1000;
    baseOptions.receiveTimeout = 60 * 1000;
    _dio = Dio(baseOptions);
    if (!kReleaseMode) {
      _dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          queryParameters: true,
          requestBody: true,
          responseHeader: true,
          responseBody: true,
          error: true,
          showProcessingTime: true,
          showCUrl: true,
          logPrint: print,
          canShowLog: kDebugMode,
        ),
      );
    }
  }

  Future<Result<T, Exception>> execute(
      UrlRequestConvertible request, JsonToModelHandle<T> handler) async {
    _dio.options.baseUrl = request.baseUrl;
    Options options =
        Options(method: request.method.name, headers: request.headers);
    try {
      Response response = await _dio.request(request.path,
          data: request.body,
          queryParameters: request.parameters,
          options: options);
      HttpStatusCode statusCode =
          HttpStatusCode(code: response.statusCode ?? -1);
      if (statusCode.isSuccess) {
        if (response.data != null && (response.data is Map<String, dynamic>)) {
          T model = handler(response.data);
          return Result(data: model, error: null);
        } else {
          return Result(
              data: null,
              error:
                  ApiException(code: null, message: Strings.apiErrorMessage));
        }
      } else {
        return Result(
            data: null,
            error: ApiException(
                code: statusCode.code, message: statusCode.description));
      }
    } catch (e) {
      if (e is DioError) {
        return Result(
            data: null, error: ApiException(code: null, message: e.message));
      } else {
        return Result(
            data: null,
            error: ApiException(code: null, message: Strings.apiErrorMessage));
      }
    }
  }
}
