import 'package:data/interceptor/interceptor.dart';
import 'package:dio/dio.dart';
import 'package:data/utils/constants.dart';

Dio dioBuilder({
  required String baseUrl,
  required List<Interceptor> interceptor,
  Map<String, dynamic>? headers,
}) {
  final options = BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: D.connectTimeout,
    receiveTimeout: D.receiveTimeout,
    sendTimeout: D.sendTimeout,
    contentType: D.applicationJson,
  );

  final dio = Dio(options);
  dio.interceptors.addAll([
    LogInterceptor(requestBody: true, responseBody: true),
    MovieRequestInterceptor(),
  ]);
  return dio;
}
