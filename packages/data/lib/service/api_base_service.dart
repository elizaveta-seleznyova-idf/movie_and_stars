import 'package:data/service/service_payload.dart';
import 'package:dio/dio.dart';

abstract class ApiBaseService<SP extends ServicePayload> {
  Future<Response<R>> get<R>(
    String path, {
    bool isResponseBytes,
    Map<String, dynamic> queryParameters,
    SP? payload,
    Options options,
  });

  Future<Response<R>> post<R>(
    String path, {
    bool isResponseBytes,
    dynamic data,
    Map<String, dynamic> queryParameters,
    SP? payload,
  });
}

class ApiServiceImpl implements ApiBaseService<DioServicePayload> {
  final Dio _dio;

  ApiServiceImpl(this._dio);

  @override
  Future<Response<R>> get<R>(
    String path, {
    bool isResponseBytes = false,
    Map<String, dynamic>? queryParameters,
    DioServicePayload? payload,
    Options? options,
  }) async {
    final response = _dio.get<R>(
      path,
      queryParameters: queryParameters,
      options: payload?.options,
      cancelToken: payload?.cancelToken,
      onReceiveProgress: payload?.onReceiveProgress,
    );

    return response;
  }

  @override
  Future<Response<R>> post<R>(
    String path, {
    bool isResponseBytes = false,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    DioServicePayload? payload,
  }) async {
    final response = _dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
      options: payload?.options,
      cancelToken: payload?.cancelToken,
      onSendProgress: payload?.onSendProgress,
      onReceiveProgress: payload?.onReceiveProgress,
    );

    return response as Future<Response<R>>;
  }
}
