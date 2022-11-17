import 'package:flutter/material.dart';
import 'package:presentation/app/app_bloc.dart';
import 'package:presentation/app/app_data.dart';
import 'package:presentation/app/app_navigations/app_navigation_items.dart';
import 'package:presentation/config/dimens/dimens.dart';
import 'package:presentation/config/theme/app_colors.dart';
import 'package:presentation/generated_localization/l10n.dart';
import 'package:presentation/utils/image_path.dart';

class AppNavigationRail extends StatefulWidget {
  const AppNavigationRail({
    required this.bloc,
    required this.blocData,
    super.key,
  });

  final AppBloc bloc;
  final AppData blocData;

  @override
  State<AppNavigationRail> createState() => _AppNavigationRailState();
}

class _AppNavigationRailState extends State<AppNavigationRail> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimens.size100,
      decoration: const BoxDecoration(
        border: Border(
          right: BorderSide(
            color: AppColorsDark.borderTabBar,
            width: Dimens.size1,
          ),
        ),
      ),
      child: NavigationRail(
        backgroundColor: AppColorsDark.primaryColorDark,
        selectedIndex: widget.blocData.currentPageIndex,
        onDestinationSelected: widget.bloc.onItemTapped,
        destinations: [
          AppNavRail(
            image: ImagesPath.homeScreen,
            label: SM.current.homePageNavRail,
          ),
          AppNavRail(
            image: ImagesPath.ticketScreen,
            label: SM.current.ticketsPageNavRail,
          ),
          AppNavRail(
            image: ImagesPath.notificationScreen,
            label: SM.current.notificationPageNavRail,
          ),
          AppNavRail(
            image: ImagesPath.profileScreen,
            label: SM.current.profilePageNavRail,
          ),
        ],
      ),
    );
  }
}
