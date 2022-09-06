import 'dart:async';
import 'package:presentation/base/bloc.dart';
import 'package:presentation/screen/home/home_screen.dart';
import 'package:presentation/screen/splash/splash_data.dart';

abstract class SplashBloc extends Bloc {
  factory SplashBloc() => SplashBlocImpl();
}

class SplashBlocImpl extends BlocImpl implements SplashBloc {
  var _state = SplashData.init();

  @override
  void initState() {
    super.initState();
    _updateData(data: _state);
    Future.delayed(
      Duration(seconds: _state.splashScreenDuration),
      () => appNavigator.popAndPush(HomeScreen.page(HomeScreenArguments())),
    );
  }

  _updateData({SplashData? data}) {
    handleData(
      data: data,
    );
  }
}
