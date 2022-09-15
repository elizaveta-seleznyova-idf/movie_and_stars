import 'package:flutter/material.dart';
import 'package:presentation/config/theme/app_colors.dart';

class HomeTabBar extends StatefulWidget {
  const HomeTabBar({Key? key}) : super(key: key);

  @override
  State<HomeTabBar> createState() => _HomeTabBarState();
}

class _HomeTabBarState extends State<HomeTabBar> {
  @override
  Widget build(BuildContext context) {
    return TabBar(
      splashBorderRadius: BorderRadius.circular(16),
      onTap: (index) {},
      indicator: BoxDecoration(
        color: AppColorsDark.primaryColor,
        borderRadius: BorderRadius.circular(16),
      ),
      tabs: <Widget>[
        Tab(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Icon(Icons.play_circle),
              SizedBox(width: 6),
              Text(
                'Now Showing',
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
        Tab(
          child: Row(
            children: const <Widget>[
              SizedBox(width: 6),
              Text(
                'Coming soon',
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
