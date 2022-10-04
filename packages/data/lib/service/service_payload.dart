import 'package:dio/dio.dart';

abstract class ServicePayload {}

class DioServicePayload implements ServicePayload {
  final Options? options;
  final CancelToken? cancelToken;
  final ProgressCallback? onReceiveProgress;
  final ProgressCallback? onSendProgress;

  const DioServicePayload(
    this.options,
    this.cancelToken,
    this.onReceiveProgress,
    this.onSendProgress,
  );
}
