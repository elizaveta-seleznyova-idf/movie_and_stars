import 'package:flutter/material.dart';
import 'package:presentation/base/bloc_data.dart';
import 'package:presentation/base/bloc_screen.dart';
import 'package:presentation/config/theme/app_colors.dart';
import 'package:presentation/navigation/base_arguments.dart';
import 'package:presentation/navigation/base_page.dart';
import 'package:presentation/screen/home/home_bloc.dart';
import 'package:presentation/screen/home/home_data.dart';
import 'package:presentation/screen/home/widgets/app_bottom_navigation_bar.dart';
import 'package:presentation/screen/home/widgets/home_body.dart';

class HomeScreenArguments extends BaseArguments {
  List<dynamic>? trendingMoviesResponse;
  List<dynamic>? anticipatedMoviesResponse;

  HomeScreenArguments({
    required this.trendingMoviesResponse,
    required this.anticipatedMoviesResponse,
    Function(dynamic value)? result,
  }) : super(result: result);
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  static const _routeName = '/HomeScreen';

  static BasePage page(HomeScreenArguments arguments) => BasePage(
        key: const ValueKey(_routeName),
        name: _routeName,
        builder: (context) => const HomeScreen(),
        showSlideAnim: true,
        arguments: arguments,
      );

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends BlocScreenState<HomeScreen, HomeBloc> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<BlocData>(
      stream: bloc.dataStream,
      builder: (context, snapshot) {
        final data = snapshot.data;

        if (data != null) {
          final HomeData blocData = data.data;
          return Scaffold(
            appBar: AppBar(
              centerTitle: false,
              backgroundColor: AppColorsDark.primaryColorDark,
              elevation: 0,
              title: const Text(
                'Star Movie',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              actions: <Widget>[
                GestureDetector(
                  onTap: () {},
                  child: const Icon(
                    Icons.search,
                    size: 35.0,
                  ),
                ),
              ],
            ),
            body: HomeBody(
              blocData: blocData,
              blocFunctions: bloc,
            ),
            bottomNavigationBar: const AppBottomNavigationBar(),
          );
        } else {
          return Scaffold(
            body: Container(),
          );
        }
      },
    );
  }
}
