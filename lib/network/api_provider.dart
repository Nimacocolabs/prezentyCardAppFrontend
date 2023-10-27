

import 'package:dio/dio.dart';
import 'package:prezenty_card_app/network/api_interceptor.dart';

class ApiProvider {
  Dio? _dio;


  static String baseUrl = 'https://b7ee-59-99-86-191.ngrok-free.app/api/';

  ApiProvider() {
    BaseOptions options;
    options = BaseOptions(
      baseUrl: baseUrl,
      followRedirects: false,
    );
    _dio = Dio(options);
    _dio!.interceptors.add(ApiInterceptor());
  }

  Dio getJsonInstance() {
    _dio!.options.headers.addAll({"Content-Type": "application/json"});
    return _dio!;
  }

  Dio getMultipartInstance() {
    _dio!.options.headers.addAll({"Content-Type": "multipart/form-data"});
    return _dio!;
  }

  Dio getJsonInstanceAuth(token) {
    _dio!.options.baseUrl = baseUrl;
    _dio!.options.headers.addAll({
      "authorization": "Bearer  $token",
    });
    return _dio!;
  }

  Dio getJsonInstanceWoohoo(token) {
    _dio!.options.baseUrl = baseUrl;
    _dio!.options.headers.addAll({
      "authorization": "Bearer  $token",
    });
    return _dio!;
  }

  Dio getJsonInstanceStatus(token) {
    _dio!.options.baseUrl = baseUrl;
    _dio!.options.headers.addAll({
      "authorization": "Bearer  $token",
    });
    return _dio!;
  }

  Dio getJsonInstancedetails(token) {
    _dio!.options.baseUrl = baseUrl;
    _dio!.options.headers.addAll({
      'Authorization': 'Bearer $token',
    });
    return _dio!;
  }
}
