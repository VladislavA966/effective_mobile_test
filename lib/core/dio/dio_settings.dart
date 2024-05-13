import "package:dio/dio.dart";
import "package:effective_mobile_test/core/consts/network_consts.dart";
import "package:flutter/foundation.dart";
import "package:injectable/injectable.dart";

@module
abstract class DioSettings {
  @singleton
  Dio get dio => Dio(
        BaseOptions(
          baseUrl: NetworkConsts.baseUrl,
          contentType: "application/json",
          headers: {
            "Accept": "application/json",
          },
          connectTimeout: const Duration(seconds: 20),
          receiveTimeout: const Duration(seconds: 20),
        ),
      )..interceptors.addAll(_setupInterceptors());

  static List<Interceptor> _setupInterceptors() {
    List<Interceptor> interceptors = [];
    final LogInterceptor logInterceptor = LogInterceptor(
      requestBody: true,
      responseBody: true,
    );

    final QueuedInterceptorsWrapper headerInterceptors =
        QueuedInterceptorsWrapper(
      onRequest: (RequestOptions options, RequestInterceptorHandler handler) =>
          handler.next(options),
      onError: (DioException error, ErrorInterceptorHandler handler) {
        handler.next(error);
      },
      onResponse: (Response response, ResponseInterceptorHandler handler) =>
          handler.next(response),
    );
    interceptors.addAll([if (kDebugMode) logInterceptor, headerInterceptors]);
    return interceptors;
  }
}
