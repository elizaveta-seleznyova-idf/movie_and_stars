import 'package:data/dio/dio_builder.dart';
import 'package:data/interceptor/interceptor.dart';
import 'package:data/repository/tmdb_repository.dart';
import 'package:data/repository/trakt_repository.dart';
import 'package:data/service/api_service.dart';
import 'package:data/service/service_payload.dart';
import 'package:data/utils/constants.dart';
import 'package:data/utils/secrets/secret.dart';
import 'package:data/utils/secrets/secret_loader.dart';
import 'package:dio/dio.dart';
import 'package:domain/repository/tmdb_repository.dart';
import 'package:domain/repository/trakt_repository.dart';
import 'package:domain/utils/const.dart';
import 'package:get_it/get_it.dart';

const keysPath = 'secrets.json';

Future<void> initDataInjector() async {
  _initApiKeyStore(await keys());
  _initApiModule();
  _initRepositoryModule();
}

Future<Map<String, dynamic>> keys() async {
  const keyStoreLoader = SecretLoader(path: keysPath);
  return keyStoreLoader.load();
}

void _initApiKeyStore(Map<String, dynamic> secretApiKeys) {
  GetIt.I.registerLazySingleton<SecretStore>(() => SecretStore(secretApiKeys));
  GetIt.I.registerFactory<String>(
    () => GetIt.I.get<SecretStore>().omdbApiKey,
    instanceName: ApiKeyNameConstant.omdbApiKey,
  );
}

void _initApiModule() {
  GetIt.I.registerFactory<TraktRequestInterceptor>(
    () => TraktRequestInterceptor(
      apiKeyStore: GetIt.I.get(),
    ),
  );
  GetIt.I.registerFactory<TmdbRequestInterceptor>(
    () => TmdbRequestInterceptor(
      apiKeyStore: GetIt.I.get(),
    ),
  );
  GetIt.I.registerSingleton<LogInterceptor>(
    LogInterceptor(
      requestBody: true,
      responseBody: true,
    ),
  );
  GetIt.I.registerSingleton<Dio>(
    dioBuilder(
      interceptors: [
        GetIt.I.get<LogInterceptor>(),
        GetIt.I.get<TraktRequestInterceptor>(),
      ],
      baseUrl: UrlConstants.baseUrl,
    ),
    instanceName: DioConstants.traktDio,
  );
  GetIt.I.registerSingleton<Dio>(
    dioBuilder(
      interceptors: [
        GetIt.I.get<LogInterceptor>(),
        GetIt.I.get<TmdbRequestInterceptor>(),
      ],
      baseUrl: UrlConstants.tMDBUrl,
    ),
    instanceName: DioConstants.tmdbDio,
  );
  GetIt.I.registerSingleton<ApiService<DioServicePayload>>(
    ApiServiceImpl(
      GetIt.I.get(instanceName: DioConstants.traktDio),
    ),
    instanceName: DioConstants.traktSetvice,
  );

  GetIt.I.registerSingleton<ApiService<DioServicePayload>>(
    ApiServiceImpl(
      GetIt.I.get(instanceName: DioConstants.tmdbDio),
    ),
    instanceName: DioConstants.tmdbSetvice,
  );
}

void _initRepositoryModule() {
  GetIt.I.registerLazySingleton<TraktRepository>(
    () => TraktRepositoryImpl(
      GetIt.I.get<ApiService<DioServicePayload>>(
        instanceName: DioConstants.traktSetvice,
      ),
    ),
  );

  GetIt.I.registerLazySingleton<TmdbRepository>(
    () => TmdbRepositoryImpl(
      GetIt.I.get<ApiService<DioServicePayload>>(
        instanceName: DioConstants.tmdbSetvice,
      ),
    ),
  );
}
