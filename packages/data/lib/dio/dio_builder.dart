import 'package:data/utils/constants.dart';
import 'package:dio/dio.dart';

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
  dio.interceptors.addAll(interceptor);
  return dio;
}
