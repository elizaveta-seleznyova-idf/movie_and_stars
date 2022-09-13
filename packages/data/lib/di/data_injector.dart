import 'package:data/dio/dio_builder.dart';
import 'package:data/interceptor/interceptor.dart';
import 'package:data/repository/movie_repository.dart';
import 'package:data/service/api_base_service.dart';
import 'package:data/service/service_payload.dart';
import 'package:domain/utils/const.dart';
import 'package:dio/dio.dart';
import 'package:domain/repository/base_repository.dart';
import 'package:get_it/get_it.dart';

void initDataInjector() {
  _initApiModule();
  _initRepositoryModule();
}

void _initApiModule() {
  GetIt.I.registerSingleton<Interceptor>(
    MovieRequestInterceptor(),
  );
  GetIt.I.registerSingleton<Dio>(
    dioBuilder(C.baseUrl),
  );
  GetIt.I.registerSingleton<ApiBaseService<ServicePayload>>(
    ApiServiceImpl(GetIt.I.get()),
  );
}

void _initRepositoryModule() {
  GetIt.I.registerSingleton<NetworkRepository>(
    NetworkRepositoryImpl(GetIt.I.get<ApiBaseService>()),
  );
}
