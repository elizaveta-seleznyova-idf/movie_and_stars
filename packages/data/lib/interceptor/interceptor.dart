import 'dart:io';

import 'package:data/utils/api_key_data.dart';
import 'package:dio/dio.dart';

class MovieRequestInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    options.headers['trakt-api-key'] = ApiKeyData.apiKeyData;
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) {
    response.headers[HttpHeaders.authorizationHeader]?.forEach(
      (element) {
        //logic
      },
    );
    super.onResponse(response, handler);
  }
}
