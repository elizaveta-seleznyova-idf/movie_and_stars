import 'package:data/service/service_payload.dart';
import 'package:dio/dio.dart';

abstract class ApiBaseService<SP extends ServicePayload> {
  Future<Response<R>> get<R>(
    String path, {
    Map<String, dynamic> queryParameters,
    SP? payload,
    Options options,
    bool isTrakt = true,
  });

  Future<Response<R>> post<R>(
    String path, {
    dynamic data,
    Map<String, dynamic> queryParameters,
    SP? payload,
    bool isTrakt = true,
  });
}

class ApiServiceImpl implements ApiBaseService<DioServicePayload> {
  final Dio _dioTRAKT;
  final Dio _dioTMDB;

  ApiServiceImpl(this._dioTRAKT, this._dioTMDB);

  @override
  Future<Response<R>> get<R>(
    String path, {
    Map<String, dynamic>? queryParameters,
    DioServicePayload? payload,
    Options? options,
    bool isTrakt = true,
  }) async {
    final response = isTrakt
        ? _dioTRAKT.get<R>(
            path,
            queryParameters: queryParameters,
            options: payload?.options,
            cancelToken: payload?.cancelToken,
            onReceiveProgress: payload?.onReceiveProgress,
          )
        : _dioTMDB.get<R>(
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
    bool isTrakt = true,
  }) async {
    final response = isTrakt
        ? _dioTRAKT.post(
            path,
            data: data,
            queryParameters: queryParameters,
            options: payload?.options,
            cancelToken: payload?.cancelToken,
            onSendProgress: payload?.onSendProgress,
            onReceiveProgress: payload?.onReceiveProgress,
          )
        : _dioTMDB.post(
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
