import 'package:data/service/service_payload.dart';
import 'package:dio/dio.dart';

abstract class ApiService<SP extends ServicePayload> {
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
