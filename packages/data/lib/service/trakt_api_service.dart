import 'package:data/service/service_payload.dart';
import 'package:dio/dio.dart';

abstract class TraktApiService<SP extends ServicePayload> {
  Future<Response<R>> get<R>(
    String path, {
    Map<String, dynamic> queryParameters,
    SP? payload,
    Options options,
  });

  Future<Response<R>> post<R>(
    String path, {
    dynamic data,
    Map<String, dynamic> queryParameters,
    SP? payload,
  });
}

class TraktApiServiceImpl implements TraktApiService<DioServicePayload> {
  final Dio _dioTRAKT;

  const TraktApiServiceImpl(
    this._dioTRAKT,
  );

  @override
  Future<Response<R>> get<R>(
    String path, {
    Map<String, dynamic>? queryParameters,
    DioServicePayload? payload,
    Options? options,
  }) async {
    final response = _dioTRAKT.get<R>(
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
    dynamic data,
    Map<String, dynamic>? queryParameters,
    DioServicePayload? payload,
  }) async {
    final response = _dioTRAKT.post(
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
