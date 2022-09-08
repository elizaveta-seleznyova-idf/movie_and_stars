import 'dart:async';
import 'package:domain/usecase/delay_use_case.dart';
import 'package:presentation/base/bloc.dart';
import 'package:presentation/screen/home/home_screen.dart';

abstract class SplashBloc extends Bloc {
  factory SplashBloc(SplashUseCase delayUseCase) => SplashBlocImpl(
        delayUseCase,
      );
}

class SplashBlocImpl extends BlocImpl implements SplashBloc {
  final SplashUseCase _blocDelayUseCase;

  SplashBlocImpl(this._blocDelayUseCase);

  @override
  void initState() {
    super.initState();
    delayed();
  }

  Future<void> delayed() async {
    await _blocDelayUseCase();
    appNavigator.popAndPush(
      HomeScreen.page(
        HomeScreenArguments(),
      ),
    );
  }
}
