import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:presentation/app/app_bloc.dart';
import 'package:presentation/app/app_bottom_navigation_bar.dart';
import 'package:presentation/app/app_data.dart';
import 'package:presentation/base/bloc_data.dart';
import 'package:presentation/base/bloc_screen.dart';
import 'package:presentation/config/theme/app_colors.dart';

class StarMovieApp extends StatefulWidget {
  const StarMovieApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _StarMovieAppState();
}

class _StarMovieAppState extends BlocScreenState<StatefulWidget, AppBloc> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Star Movie app',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColorDark: AppColorsDark.primaryColorDark,
        canvasColor: AppColorsDark.canvasColor,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: StreamBuilder<BlocData>(
        stream: bloc.dataStream,
        builder: (context, result) {
          final blocData = result.data;
          final appData = blocData?.data;
          if (appData is AppData && blocData != null) {
            return Scaffold(
              body: Navigator(
                onPopPage: (Route<dynamic> route, dynamic result) {
                  bloc.handleRemoveRouteSettings(route.settings);
                  return route.didPop(result);
                },
                pages: appData.pages.toList(),
              ),
              bottomNavigationBar: appData.isButtonNavBarActive
                  ? AppBottomNavigationBar(
                      bloc: bloc,
                    )
                  : const SizedBox(),
            );
          }
          return Container();
        },
      ),
    );
  }
}
