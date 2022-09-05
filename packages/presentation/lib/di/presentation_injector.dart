import 'package:get_it/get_it.dart';
import 'package:presentation/app/app_bloc.dart';
import 'package:presentation/navigation/app_navigation.dart';

void initPresentationInjector() {
  _initAppModule();
  _initViewMapperModule();
  _initBlocModule();
}

void _initViewMapperModule() {}

void _initBlocModule() {}

void _initAppModule() {
  GetIt.I.registerFactory<AppBloc>(
    () => AppBloc(),
  );
  GetIt.I.registerSingleton<AppNavigator>(
    AppNavigator(),
  );
}
