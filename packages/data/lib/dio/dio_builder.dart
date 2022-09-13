import 'package:data/interceptor/interceptor.dart';
import 'package:dio/dio.dart';
import 'package:data/utils/constants.dart';

Dio dioBuilder(
  String baseUrl, {
  Map<String, dynamic>? headers,
}) {
  final options = BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: D.connectTimeout,
    receiveTimeout: D.receiveTimeout,
    sendTimeout: D.sendTimeout,
    contentType: 'application/json',
  );

  final dio = Dio(options);
  dio.interceptors.addAll([
    LogInterceptor(requestBody: true, responseBody: true),
    MovieRequestInterceptor(),
  ]);
  return dio;
}
