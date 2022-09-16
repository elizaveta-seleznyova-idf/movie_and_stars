import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:presentation/config/theme/app_colors.dart';
import 'package:presentation/utils/image_path.dart';

class AppBottomNavigationBar extends StatefulWidget {
  const AppBottomNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  State<AppBottomNavigationBar> createState() => _AppBottomNavigationBarState();
}

class _AppBottomNavigationBarState extends State<AppBottomNavigationBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: AppColorsDark.borderTabBar, width: 1),
        ),
      ),
      child: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              ImagesPath.homeScreen,
              color: AppColorsDark.unselectedColor,
            ),
            activeIcon: SvgPicture.asset(
              ImagesPath.homeScreen,
              color: AppColorsDark.selectedBottomNavItem,
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
              color: AppColorsDark.selectedBottomNavItem,
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
              color: AppColorsDark.selectedBottomNavItem,
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
              color: AppColorsDark.selectedBottomNavItem,
            ),
            label: 'ProfilePage',
          ),
        ],
      ),
    );
  }
}
