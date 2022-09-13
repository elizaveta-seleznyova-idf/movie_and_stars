import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:presentation/base/bloc_screen.dart';
import 'package:presentation/config/theme/app_colors.dart';
import 'package:presentation/navigation/base_page.dart';
import 'package:presentation/screen/splash/splash_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static const _routeName = '/SplashScreen';

  static BasePage page() => BasePage(
        key: const ValueKey(_routeName),
        name: _routeName,
        builder: (context) => const SplashScreen(),
      );

  @override
  State createState() => _SplashScreenState();
}

class _SplashScreenState extends BlocScreenState<SplashScreen, SplashBloc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              AppColorsDark.primaryColor,
              AppColorsDark.primaryGradientEnd,
            ],
          ),
        ),
        child: Center(
          child: SvgPicture.asset(
            'assets/splash_image.svg',
            semanticsLabel: 'Splash Image',
          ),
        ),
      ),
    );
  }
}
