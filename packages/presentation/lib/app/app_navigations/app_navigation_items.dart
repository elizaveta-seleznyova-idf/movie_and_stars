import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:presentation/config/theme/app_colors.dart';

class AppBottomNavItem extends BottomNavigationBarItem {
  AppBottomNavItem({
    required String image,
    required String label,
  }) : super(
          icon: SvgPicture.asset(
            image,
            color: AppColorsDark.unselectedColor,
          ),
          activeIcon: SvgPicture.asset(
            image,
            color: AppColorsDark.selectedItem,
          ),
          label: label,
        );
}

class AppNavRail extends NavigationRailDestination {
  AppNavRail({
    required String image,
    required String label,
  }) : super(
          icon: SvgPicture.asset(
            image,
            color: AppColorsDark.unselectedColor,
          ),
          selectedIcon: SvgPicture.asset(
            image,
            color: AppColorsDark.selectedItem,
          ),
          label: Text(label),
        );
}
