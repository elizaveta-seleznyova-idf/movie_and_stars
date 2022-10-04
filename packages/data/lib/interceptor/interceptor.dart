import 'package:data/utils/constants.dart';
import 'package:data/utils/secrets/secret.dart';
import 'package:dio/dio.dart';

class TraktRequestInterceptor extends Interceptor {
  final SecretStore apiKeyStore;

  TraktRequestInterceptor({required this.apiKeyStore});

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    options.headers[DioConstants.traktApiKey] = apiKeyStore.traktApiKey;
    return super.onRequest(
      options,
      handler,
    );
  }
}

class TmdbRequestInterceptor extends Interceptor {
  final SecretStore apiKeyStore;

  TmdbRequestInterceptor({required this.apiKeyStore});

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    options.queryParameters.addAll({
      QueryParametersConstants.apiKey: apiKeyStore.tmdbApiKey,
    });
    return super.onRequest(
      options,
      handler,
    );
  }
}
