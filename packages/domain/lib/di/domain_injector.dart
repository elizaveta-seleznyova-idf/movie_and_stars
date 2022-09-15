import 'package:domain/repository/base_repository.dart';
import 'package:domain/use_case/delay_use_case.dart';
import 'package:domain/use_case/get_anticipated_movies_use_case.dart';
import 'package:domain/use_case/get_trending_movies_use_case.dart';
import 'package:get_it/get_it.dart';

void initDomainInjector() {
  _initUseCaseModule();
}

void _initUseCaseModule() {
  GetIt.I.registerFactory<SplashUseCase>(
    () => SplashUseCase(),
  );
  GetIt.I.registerFactory<GetTrendingMoviesUseCase>(
    () => GetTrendingMoviesUseCase(
      GetIt.I.get<NetworkRepository>(),
    ),
  );
  GetIt.I.registerFactory<GetAnticipatedMoviesUseCase>(
    () => GetAnticipatedMoviesUseCase(
      GetIt.I.get<NetworkRepository>(),
    ),
  );
}
