import 'package:flutter/material.dart';
import 'package:presentation/app/app_bloc.dart';
import 'package:presentation/app/app_data.dart';
import 'package:presentation/app/app_navigations/app_navigation_items.dart';
import 'package:presentation/config/dimens/dimens.dart';
import 'package:presentation/config/theme/app_colors.dart';
import 'package:presentation/generated_localization/l10n.dart';
import 'package:presentation/utils/image_path.dart';

class AppBottomNavigationBar extends StatefulWidget {
  const AppBottomNavigationBar({
    required this.bloc,
    required this.blocData,
    super.key,
  });

  final AppBloc bloc;
  final AppData blocData;

  @override
  State<AppBottomNavigationBar> createState() => _AppBottomNavigationBarState();
}

class _AppBottomNavigationBarState extends State<AppBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: AppColorsDark.borderTabBar,
            width: Dimens.size1,
          ),
        ),
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: widget.blocData.currentPageIndex,
        onTap: widget.bloc.onItemTapped,
        items: [
          AppBottomNavItem(
            image: ImagesPath.homeScreen,
            label: SM.current.homePageNavRail,
          ),
          AppBottomNavItem(
            image: ImagesPath.ticketScreen,
            label: SM.current.ticketsPageNavRail,
          ),
          AppBottomNavItem(
            image: ImagesPath.notificationScreen,
            label: SM.current.notificationPageNavRail,
          ),
          AppBottomNavItem(
            image: ImagesPath.profileScreen,
            label: SM.current.profilePageNavRail,
          ),
        ],
      ),
    );
  }
}
