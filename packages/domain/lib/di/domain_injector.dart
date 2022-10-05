import 'package:domain/mappers/movie_to_image.dart';
import 'package:domain/repository/auth_repository.dart';
import 'package:domain/repository/preference_local_repository.dart';
import 'package:domain/repository/tmdb_repository.dart';
import 'package:domain/repository/trakt_repository.dart';
import 'package:domain/use_case/delay_use_case.dart';
import 'package:domain/use_case/get_movies_use_case.dart';
import 'package:domain/use_case/get_people_use_case.dart';
import 'package:domain/use_case/login_email_and_password_use_case.dart';
import 'package:domain/use_case/login_facebook_use_case.dart';
import 'package:domain/use_case/login_google_use_case.dart';
import 'package:domain/utils/const.dart';
import 'package:get_it/get_it.dart';

void initDomainInjector() {
  _initUseCaseModule();
  _initApiModule();
}

void _initUseCaseModule() {
  GetIt.I.registerFactory<DelayUseCase>(
    () => DelayUseCase(),
  );
  GetIt.I.registerFactory<GetMoviesUseCase>(
    () => GetMoviesUseCase(
      GetIt.I.get<TraktRepository>(),
    ),
  );
  GetIt.I.registerFactory<GetPeopleUseCase>(
    () => GetPeopleUseCase(
      GetIt.I.get<TraktRepository>(),
      GetIt.I.get<TmdbRepository>(),
    ),
  );
  GetIt.I.registerFactory<LoginFaceBookUseCase>(
    () => LoginFaceBookUseCase(
      GetIt.I.get<AuthRepository>(),
      GetIt.I.get<PreferencesLocalRepository>(),
    ),
  );
  GetIt.I.registerFactory<LoginGoogleUseCase>(
    () => LoginGoogleUseCase(
      GetIt.I.get<AuthRepository>(),
      GetIt.I.get<PreferencesLocalRepository>(),
    ),
  );
  GetIt.I.registerFactory<LoginEmailAndPassUseCase>(
    () => LoginEmailAndPassUseCase(
      GetIt.I.get<AuthRepository>(),
      GetIt.I.get<PreferencesLocalRepository>(),
    ),
  );
}

void _initApiModule() {
  GetIt.I.registerFactory<MovieToImage>(
    () => MovieToImage(
      apiKey: GetIt.I.get(instanceName: ApiKeyNameConstant.omdbApiKey),
    ),
  );
}
