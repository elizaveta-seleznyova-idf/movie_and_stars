import 'package:domain/repository/base_repository.dart';
import 'package:domain/usecase/delay_use_case.dart';
import 'package:domain/usecase/get_anticipated_movies_use_case.dart';
import 'package:domain/usecase/get_trending_movies_use_case.dart';
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
