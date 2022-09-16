import 'package:data/utils/api_key_data.dart';
import 'package:data/utils/constants.dart';
import 'package:dio/dio.dart';

class MovieRequestInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    options.headers[D.traktApiKey] = ApiKeyData.apiKeyData;
    return super.onRequest(options, handler);
  }
}
