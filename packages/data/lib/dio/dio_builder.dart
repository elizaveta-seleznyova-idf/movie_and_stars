import 'package:data/utils/constants.dart';
import 'package:dio/dio.dart';

Dio dioBuilder({
  required String baseUrl,
  required List<Interceptor> interceptors,
  Map<String, dynamic>? headers,
}) {
  final options = BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: DioConstants.connectTimeout,
    receiveTimeout: DioConstants.receiveTimeout,
    sendTimeout: DioConstants.sendTimeout,
    contentType: DioConstants.applicationJson,
  );

  final dio = Dio(options);
  dio.interceptors.addAll(interceptors);
  return dio;
}
