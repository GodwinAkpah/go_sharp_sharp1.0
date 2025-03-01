import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class LoggingInterceptor extends Interceptor {
  final logger = Logger(
    printer: PrettyPrinter(
      printEmojis: false,
      methodCount: 0, // No stack trace for info/debug logs
    ),
  );


  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final requestBody = options.data is FormData
        ? '[FormData with ${options.data.files.length} files]'
        : jsonEncode((options.data));

    logger.i("""
  ┌──────────────────────────────────────────────────────────
  │ REQUEST: ${options.method} ${options.baseUrl}${options.path}
  │ HEADER: ${options.headers}
  │ PARAMS: ${options.queryParameters}
  │ BODY: ${options.method != 'GET' ? requestBody : 'N/A'}
  └──────────────────────────────────────────────────────────
  """);
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final sanitizedData = (response.data);

    logger.d("""
    ┌──────────────────────────────────────────────────────────
    │ RESPONSE [${response.statusCode}]: ${response.realUri}
    │ Data: ${jsonEncode(sanitizedData)}
    └──────────────────────────────────────────────────────────
    """);
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final sanitizedData = (err.response?.data);

    logger.e("""
    ┌──────────────────────────────────────────────────────────
    │ ERROR: ${err.type} ${err.requestOptions.method} ${err.requestOptions.uri}
    │ Status Code: ${err.response?.statusCode ?? 'N/A'}
    │ Error Data: ${jsonEncode(sanitizedData)}
    │ DioException Type: ${err.type}
    └──────────────────────────────────────────────────────────
    """);
    super.onError(err, handler);
  }
}