import 'package:data/utils/api_key_data.dart';
import 'package:data/utils/constants.dart';
import 'package:dio/dio.dart';

class RequestInterceptorTRAKT extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    options.headers[DioConstants.traktApiKey] = ApiKeyData.apiKeyData;
    return super.onRequest(
      options,
      handler,
    );
  }
}

class RequestInterceptorTMDB extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    options.queryParameters.addAll({
      QueryParametersConstants.apiKey: ApiKeyData.apiKeyTMDB,
    });
    return super.onRequest(
      options,
      handler,
    );
  }
}
