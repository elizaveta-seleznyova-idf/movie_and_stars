import 'package:data/dio/dio_builder.dart';
import 'package:data/interceptor/interceptor.dart';
import 'package:data/repository/trakt_repository.dart';
import 'package:data/repository/tmdb_repository.dart';
import 'package:data/service/api_base_service.dart';
import 'package:data/service/service_payload.dart';
import 'package:data/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:domain/repository/general_repository.dart';
import 'package:domain/repository/tmdb_repository.dart';
import 'package:get_it/get_it.dart';

void initDataInjector() {
  _initApiModule();
  _initRepositoryModule();
}

void _initApiModule() {
  GetIt.I.registerSingleton<Interceptor>(
    RequestInterceptorTRAKT(),
    instanceName: D.traktInterceptor,
  );
  GetIt.I.registerSingleton<Interceptor>(
    RequestInterceptorTMDB(),
    instanceName: D.tmdbInterceptor,
  );
  GetIt.I.registerSingleton<Dio>(
    dioBuilder(
      interceptor: [
        LogInterceptor(
          requestBody: true,
          responseBody: true,
        ),
        GetIt.instance.get(instanceName: D.traktInterceptor),
      ],
      baseUrl: C.baseUrl,
    ),
    instanceName: D.traktDio,
  );
  GetIt.I.registerSingleton<Dio>(
    dioBuilder(
      interceptor: [
        LogInterceptor(
          requestBody: true,
          responseBody: true,
        ),
        GetIt.instance.get(instanceName: D.tmdbInterceptor),
      ],
      baseUrl: C.tMDBUrl,
    ),
    instanceName: D.tmdbDio,
  );
  GetIt.I.registerSingleton<ApiBaseService<ServicePayload>>(
    ApiServiceImpl(
      GetIt.I.get(instanceName: D.traktDio),
      GetIt.I.get(instanceName: D.tmdbDio),
    ),
  );
}

void _initRepositoryModule() {
  GetIt.I.registerSingleton<TRAKTRepository>(
    TRAKTRepositoryImpl(GetIt.I.get<ApiBaseService>()),
  );

  GetIt.I.registerSingleton<TMDBRepository>(
    TMDBRepositoryImpl(GetIt.I.get<ApiBaseService>()),
  );
}
