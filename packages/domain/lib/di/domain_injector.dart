import 'package:domain/repository/general_repository.dart';
import 'package:domain/repository/tmdb_repository.dart';
import 'package:domain/use_case/delay_use_case.dart';
import 'package:domain/use_case/get_movies_use_case.dart';
import 'package:domain/use_case/get_people_use_case.dart';
import 'package:get_it/get_it.dart';

void initDomainInjector() {
  _initUseCaseModule();
}

void _initUseCaseModule() {
  GetIt.I.registerFactory<DelayUseCase>(
    () => DelayUseCase(),
  );
  GetIt.I.registerFactory<GetMoviesUseCase>(
    () => GetMoviesUseCase(
      GetIt.I.get<TRAKTRepository>(),
    ),
  );
  GetIt.I.registerFactory<GetPeopleUseCase>(
    () => GetPeopleUseCase(
      GetIt.I.get<TRAKTRepository>(),
      GetIt.I.get<TMDBRepository>(),
    ),
  );
}
