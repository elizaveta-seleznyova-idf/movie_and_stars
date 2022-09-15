import 'package:domain/use_case/delay_use_case.dart';
import 'package:domain/use_case/get_anticipated_movies_use_case.dart';
import 'package:domain/use_case/get_trending_movies_use_case.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation/app/app_bloc.dart';
import 'package:presentation/navigation/app_navigation.dart';
import 'package:presentation/screen/home/home_bloc.dart';
import 'package:presentation/screen/splash/splash_bloc.dart';

void initPresentationInjector() {
  _initAppModule();
  _initViewMapperModule();
  _initBlocModule();
}

void _initViewMapperModule() {}

void _initBlocModule() {
  GetIt.I.registerFactory<SplashBloc>(
    () => SplashBloc(
      GetIt.I.get<SplashUseCase>(),
    ),
  );
  GetIt.I.registerFactory<HomeBloc>(
    () => HomeBloc(
      GetIt.I.get<GetTrendingMoviesUseCase>(),
      GetIt.I.get<GetAnticipatedMoviesUseCase>(),
    ),
  );
}

void _initAppModule() {
  GetIt.I.registerFactory<AppBloc>(
    () => AppBloc(),
  );
  GetIt.I.registerSingleton<AppNavigator>(
    AppNavigatorImpl(),
  );
}
