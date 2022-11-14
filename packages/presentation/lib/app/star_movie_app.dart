import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:presentation/app/app_bloc.dart';
import 'package:presentation/app/app_data.dart';
import 'package:presentation/app/app_scaffolds/app_scaffold_desktop.dart';
import 'package:presentation/app/app_scaffolds/app_scaffold_mobile.dart';
import 'package:presentation/base/bloc_data.dart';
import 'package:presentation/base/bloc_screen.dart';
import 'package:presentation/config/dimens/dimens.dart';
import 'package:presentation/config/responsive/responsive.dart';
import 'package:presentation/config/theme/app_colors.dart';
import 'package:presentation/generated_localization/l10n.dart';

class StarMovieApp extends StatefulWidget {
  const StarMovieApp({super.key});

  @override
  State<StatefulWidget> createState() => _StarMovieAppState();
}

class _StarMovieAppState extends BlocScreenState<StatefulWidget, AppBloc> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Dimens.figmaScreenSize,
      useInheritedMediaQuery: true,
      builder: (context, child) {
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
          localizationsDelegates: const [
            SM.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: SM.delegate.supportedLocales,
          home: StreamBuilder<BlocData>(
            stream: bloc.dataStream,
            builder: (context, result) {
              final blocData = result.data;
              final appData = blocData?.data;
              if (appData is AppData && blocData != null) {
                return Responsive.isMobile(context)
                    ? AppScaffoldMobile(
                        appBloc: bloc,
                        appData: appData,
                      )
                    : AppScaffoldDesktop(
                        appBloc: bloc,
                        appData: appData,
                      );
              }
              return Container();
            },
          ),
        );
      },
    );
  }
}
