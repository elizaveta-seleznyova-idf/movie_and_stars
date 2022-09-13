import 'package:flutter/material.dart';
import 'package:presentation/presentation.dart';

class HomeTabBar extends StatefulWidget {
  const HomeTabBar({Key? key}) : super(key: key);

  @override
  State<HomeTabBar> createState() => _HomeTabBarState();
}

class _HomeTabBarState extends State<HomeTabBar> {
  int currentIndex = 0;
  bool isIconActive = false;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      splashBorderRadius: BorderRadius.circular(16),
      onTap: (index) {
        setState(() {
          if (index == currentIndex) return;
          currentIndex = index;
          isIconActive = !isIconActive;
        });
      },
      indicator: BoxDecoration(
        color: AppColorsDark.primaryColor,
        borderRadius: BorderRadius.circular(16),
      ),
      tabs: <Widget>[
        Tab(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              !isIconActive ? const Icon(Icons.play_circle) : const SizedBox(),
              const SizedBox(width: 6),
              const Text(
                'Now Showing',
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
        Tab(
          child: Row(
            children: <Widget>[
              isIconActive ? const Icon(Icons.play_circle) : const SizedBox(),
              const SizedBox(width: 6),
              const Text(
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
