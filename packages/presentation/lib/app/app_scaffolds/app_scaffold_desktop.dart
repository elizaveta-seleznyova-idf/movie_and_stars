import 'package:flutter/material.dart';
import 'package:presentation/app/app_bloc.dart';
import 'package:presentation/app/app_data.dart';
import 'package:presentation/app/app_navigations/app_navigation_rail.dart';

class AppScaffoldDesktop extends StatelessWidget {
  const AppScaffoldDesktop({
    required this.appBloc,
    required this.appData,
    super.key,
  });

  final AppBloc appBloc;
  final AppData appData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          appData.isButtonNavBarActive
              ? AppNavigationRail(
                  bloc: appBloc,
                  blocData: appData,
                )
              : const SizedBox.shrink(),
          Expanded(
            child: Navigator(
              onPopPage: (Route<dynamic> route, dynamic result) {
                appBloc.handleRemoveRouteSettings(route.settings);
                return route.didPop(result);
              },
              pages: appData.pages.toList(),
            ),
          ),
        ],
      ),
    );
  }
}
