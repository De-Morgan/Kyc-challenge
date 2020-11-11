import 'package:dio/dio.dart';
import 'package:flutter_kyc/env_config.dart';

import 'api_error.dart';
export 'package:dio/dio.dart';

class NetworkProvider {
  static const int CONNECT_TIME_OUT = 30000;
  static const int RECEIVE_TIME_OUT = 30000;
  Dio dio;

  NetworkProvider(
      {String baseUrl = EnvironmentConfig.BASE_API, Interceptor interceptor}) {
    dio = Dio(BaseOptions(
      connectTimeout: CONNECT_TIME_OUT,
      receiveTimeout: RECEIVE_TIME_OUT,
      baseUrl: baseUrl,
    ));
    dio.interceptors.add(LogInterceptor(logPrint: printDioLogs));
    if (interceptor != null) {
      dio.interceptors.add(interceptor);
    }
  }

  NetworkProvider.test(this.dio);

  Future<Response> call(
    String path,
    RequestMethod method, {
    Map<String, dynamic> queryParams,
    data,
    FormData formData,
  }) async {
    Response response;
    var params = queryParams ?? {};
    params.addAll(requiredParams);

    try {
      switch (method) {
        case RequestMethod.post:
          response = await dio.post(path, queryParameters: params, data: data);
          break;
        case RequestMethod.get:
          response = await dio.get(path, queryParameters: params);
          break;
        case RequestMethod.put:
          response = await dio.put(path, queryParameters: params, data: data);
          break;
        case RequestMethod.delete:
          response =
              await dio.delete(path, queryParameters: params, data: data);
          break;
        case RequestMethod.upload:
          response = await dio.post(path,
              data: formData,
              queryParameters: params,
              onSendProgress: (sent, total) {});
          break;
      }
      return response;
    } on DioError catch (error, stackTrace) {
      var apiError = ApiError.fromDio(error);
      return Future.error(apiError, stackTrace);
    }
  }

  Map<String, dynamic> get requiredParams {
    var params = <String, dynamic>{};
    return params;
  }
}

enum RequestMethod { post, get, put, delete, upload }
void printWrapped(String text) {
  final pattern = new RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}

void printDioLogs(Object object) {
  printWrapped(object.toString());
}
