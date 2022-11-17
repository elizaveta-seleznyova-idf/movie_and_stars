import 'package:flutter/material.dart';
import 'package:presentation/app/app_bloc.dart';
import 'package:presentation/app/app_data.dart';
import 'package:presentation/app/app_navigations/app_bottom_navigation_bar.dart';

class AppScaffoldMobile extends StatelessWidget {
  const AppScaffoldMobile({
    required this.appBloc,
    required this.appData,
    super.key,
  });

  final AppBloc appBloc;
  final AppData appData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Navigator(
          onPopPage: (Route<dynamic> route, dynamic result) {
            appBloc.handleRemoveRouteSettings(route.settings);
            return route.didPop(result);
          },
          pages: appData.pages.toList(),
        ),
        bottomNavigationBar: appData.isButtonNavBarActive
            ? AppBottomNavigationBar(
                bloc: appBloc,
                blocData: appData,
              )
            : const SizedBox.shrink());
  }
}
