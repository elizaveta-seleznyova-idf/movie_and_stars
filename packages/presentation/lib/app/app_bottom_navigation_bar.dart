import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:presentation/app/app_bloc.dart';
import 'package:presentation/app/app_data.dart';
import 'package:presentation/config/dimens/dimens.dart';
import 'package:presentation/config/theme/app_colors.dart';
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
        onTap: (index) {
          widget.bloc.onItemTapped(index);
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              ImagesPath.homeScreen,
              color: AppColorsDark.unselectedColor,
            ),
            activeIcon: SvgPicture.asset(
              ImagesPath.homeScreen,
              color: AppColorsDark.selectedItem,
            ),
            label: 'HomePage',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              ImagesPath.ticketScreen,
              color: AppColorsDark.unselectedColor,
            ),
            activeIcon: SvgPicture.asset(
              ImagesPath.ticketScreen,
              color: AppColorsDark.selectedItem,
            ),
            label: 'TicketsPage',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              ImagesPath.notificationScreen,
              color: AppColorsDark.unselectedColor,
            ),
            activeIcon: SvgPicture.asset(
              ImagesPath.notificationScreen,
              color: AppColorsDark.selectedItem,
            ),
            label: 'NotificationPage',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              ImagesPath.profileScreen,
              color: AppColorsDark.unselectedColor,
            ),
            activeIcon: SvgPicture.asset(
              ImagesPath.profileScreen,
              color: AppColorsDark.selectedItem,
            ),
            label: 'ProfilePage',
          ),
        ],
      ),
    );
  }
}
