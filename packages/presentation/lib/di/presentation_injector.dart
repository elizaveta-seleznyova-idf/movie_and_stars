import 'package:domain/mappers/movie_to_image.dart';
import 'package:domain/use_case/delay_use_case.dart';
import 'package:domain/use_case/get_movies_use_case.dart';
import 'package:domain/use_case/get_people_use_case.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation/app/app_bloc.dart';
import 'package:presentation/navigation/app_navigation.dart';
import 'package:presentation/screen/home/home_bloc.dart';
import 'package:presentation/screen/home/mapper/movie_mapper.dart';
import 'package:presentation/screen/movie_details/details_bloc.dart';
import 'package:presentation/screen/movie_details/mapper/details_mapper.dart';
import 'package:presentation/screen/splash/splash_bloc.dart';

void initPresentationInjector() {
  _initAppModule();
  _initViewMapperModule();
  _initBlocModule();
}

void _initViewMapperModule() {
  GetIt.I.registerFactory<MapperMovie>(
    () => MapperMovie(
      GetIt.I.get<MovieToImage>(),
    ),
  );
  GetIt.I.registerFactory<MapperDetails>(
    () => MapperDetails(
      GetIt.I.get<MovieToImage>(),
    ),
  );
}

void _initBlocModule() {
  GetIt.I.registerFactory<SplashBloc>(
    () => SplashBloc(GetIt.I.get<DelayUseCase>()),
  );
  GetIt.I.registerFactory<HomeBloc>(
    () => HomeBloc(
      GetIt.I.get<GetMoviesUseCase>(),
      GetIt.I.get<MapperMovie>(),
    ),
  );
  GetIt.I.registerFactory<DetailsBloc>(
    () => DetailsBloc(
      GetIt.I.get<GetPeopleUseCase>(),
      GetIt.I.get<MapperDetails>(),
    ),
  );
}

void _initAppModule() {
  GetIt.I.registerFactory<AppBloc>(() => AppBloc());
  GetIt.I.registerSingleton<AppNavigator>(AppNavigatorImpl());
}
