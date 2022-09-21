import 'package:flutter/material.dart';
import 'package:presentation/config/theme/app_colors.dart';
import 'package:presentation/screen/home/home_bloc.dart';
import 'package:presentation/screen/home/home_data.dart';

class HomeTabBar extends StatefulWidget {
  const HomeTabBar({
    Key? key,
    required this.bloc,
    required this.data,
    required this.tabController,
  }) : super(key: key);

  final HomeBloc bloc;
  final HomeData data;
  final TabController tabController;

  @override
  State<HomeTabBar> createState() => _HomeTabBarState();
}

class _HomeTabBarState extends State<HomeTabBar> {
  int currentIndex = 0;
  bool isIconActive = false;

  @override
  void initState() {
    super.initState();
    widget.tabController.addListener(() {
      setState(() {
        if (widget.tabController.index == currentIndex) return;
        currentIndex = widget.tabController.index;

        isIconActive = !isIconActive;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: widget.tabController,
      splashBorderRadius: BorderRadius.circular(16),
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
