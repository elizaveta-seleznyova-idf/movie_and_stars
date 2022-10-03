import 'package:data/dio/dio_builder.dart';
import 'package:data/interceptor/interceptor.dart';
import 'package:data/repository/tmdb_repository.dart';
import 'package:data/repository/trakt_repository.dart';
import 'package:data/service/service_payload.dart';
import 'package:data/service/tmdb_api_service.dart';
import 'package:data/service/trakt_api_service.dart';
import 'package:data/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:domain/repository/tmdb_repository.dart';
import 'package:domain/repository/trakt_repository.dart';
import 'package:get_it/get_it.dart';

void initDataInjector() {
  _initApiModule();
  _initRepositoryModule();
}

void _initApiModule() {
  GetIt.I.registerSingleton<Interceptor>(
    RequestInterceptorTRAKT(),
    instanceName: DioConstants.traktInterceptor,
  );
  GetIt.I.registerSingleton<Interceptor>(
    RequestInterceptorTMDB(),
    instanceName: DioConstants.tmdbInterceptor,
  );
  GetIt.I.registerSingleton<Dio>(
    dioBuilder(
      interceptor: [
        LogInterceptor(
          requestBody: true,
          responseBody: true,
        ),
        GetIt.instance.get(instanceName: DioConstants.traktInterceptor),
      ],
      baseUrl: UrlConstants.baseUrl,
    ),
    instanceName: DioConstants.traktDio,
  );
  GetIt.I.registerSingleton<Dio>(
    dioBuilder(
      interceptor: [
        LogInterceptor(
          requestBody: true,
          responseBody: true,
        ),
        GetIt.instance.get(instanceName: DioConstants.tmdbInterceptor),
      ],
      baseUrl: UrlConstants.tMDBUrl,
    ),
    instanceName: DioConstants.tmdbDio,
  );
  GetIt.I.registerSingleton<TraktApiService<ServicePayload>>(
    TraktApiServiceImpl(
      GetIt.I.get(instanceName: DioConstants.traktDio),
    ),
  );

  GetIt.I.registerSingleton<TmdbApiService<ServicePayload>>(
    TmdbApiServiceImpl(
      GetIt.I.get(instanceName: DioConstants.tmdbDio),
    ),
  );
}

void _initRepositoryModule() {
  GetIt.I.registerSingleton<TRAKTRepository>(
    TRAKTRepositoryImpl(GetIt.I.get<TraktApiService>()),
  );

  GetIt.I.registerSingleton<TMDBRepository>(
    TMDBRepositoryImpl(GetIt.I.get<TmdbApiService>()),
  );
}
