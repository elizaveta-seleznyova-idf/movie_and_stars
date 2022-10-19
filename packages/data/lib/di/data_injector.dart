import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data/dio/dio_builder.dart';
import 'package:data/interceptor/interceptor.dart';
import 'package:data/repository/auth_repository.dart';
import 'package:data/repository/preference_local_repository.dart';
import 'package:data/repository/tmdb_repository.dart';
import 'package:data/repository/trakt_repository.dart';
import 'package:data/service/analytics_service.dart';
import 'package:data/service/api_service.dart';
import 'package:data/service/service_payload.dart';
import 'package:data/utils/constants.dart';
import 'package:data/utils/secrets/secret_loader.dart';
import 'package:data/utils/secrets/secret_store.dart';
import 'package:dio/dio.dart';
import 'package:domain/repository/auth_repository.dart';
import 'package:domain/repository/preference_local_repository.dart';
import 'package:domain/repository/tmdb_repository.dart';
import 'package:domain/repository/trakt_repository.dart';
import 'package:domain/services/analytics_service.dart';
import 'package:domain/utils/const.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> initDataInjector() async {
  _initApiKeyStore(await keys());
  _initApiModule();
  _initRepositoryModule();
  await _initLocalModule();
}

Future<Map<String, dynamic>> keys() async {
  const keysPath = 'secrets.json';
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
  GetIt.I.registerSingleton<FirebaseAnalytics>(FirebaseAnalytics.instance);
}

void _initRepositoryModule() {
  GetIt.I.registerSingleton<AnalyticsService>(
    AnalyticsServiceImpl(
      GetIt.I.get<FirebaseAnalytics>(),
    ),
  );

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

  GetIt.I.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      FirebaseAuth.instance,
      FirebaseFirestore.instance,
      FacebookAuth.instance,
    ),
  );
}

Future<void> _initLocalModule() async {
  GetIt.I.registerSingleton(await SharedPreferences.getInstance());
  GetIt.I.registerLazySingleton<PreferencesLocalRepository>(
    () => PreferencesLocalRepositoryImpl(sharedPreferences: GetIt.I.get()),
  );
}
