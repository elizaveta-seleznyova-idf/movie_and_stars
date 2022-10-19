import 'package:flutter/material.dart';
import 'package:presentation/base/bloc_data.dart';
import 'package:presentation/base/bloc_screen.dart';
import 'package:presentation/config/dimens/dimens.dart';
import 'package:presentation/config/text_style/text_style.dart';
import 'package:presentation/config/theme/app_colors.dart';
import 'package:presentation/generated_localization/l10n.dart';
import 'package:presentation/navigation/base_arguments.dart';
import 'package:presentation/navigation/base_page.dart';
import 'package:presentation/screen/home/home_bloc.dart';
import 'package:presentation/screen/home/home_data.dart';
import 'package:presentation/screen/home/widgets/home_body.dart';

class HomeScreenArguments extends BaseArguments {
  HomeScreenArguments({
    Function(dynamic value)? result,
  }) : super(result: result);
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const _routeName = '/HomeScreen';

  static BasePage page(HomeScreenArguments arguments) => BasePage(
        key: const ValueKey(_routeName),
        name: _routeName,
        builder: (context) => const HomeScreen(),
        showSlideAnim: true,
        arguments: arguments,
        isButtonNavBarActive: true,
      );

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends BlocScreenState<HomeScreen, HomeBloc> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<BlocData<HomeData?>>(
      stream: bloc.dataStream,
      builder: (context, snapshot) {
        final data = snapshot.data;
        final HomeData? blocData = data?.data;
        if (data != null && blocData != null) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: false,
              backgroundColor: AppColorsDark.primaryColorDark,
              elevation: Dimens.size0,
              title: Text(
                SM.current.homeTitle,
                style: AppTextStyles.sfProSemiBold24px,
              ),
              actions: <Widget>[
                GestureDetector(
                  onTap: () {},
                  child: const Icon(
                    Icons.search,
                    size: Dimens.size35,
                  ),
                ),
                const SizedBox(width: Dimens.size18),
              ],
            ),
            body: HomeBody(
              data: data,
              blocData: blocData,
              bloc: bloc,
            ),
          );
        } else {
          return Scaffold(
            body: Center(
              child: Text(SM.current.error),
            ),
          );
        }
      },
    );
  }
}
