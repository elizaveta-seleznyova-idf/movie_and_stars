import 'package:flutter/material.dart';
import 'package:presentation/config/dimens/dimens.dart';
import 'package:presentation/config/responsive/responsive.dart';
import 'package:presentation/config/text_style/text_style.dart';
import 'package:presentation/config/theme/app_colors.dart';
import 'package:presentation/generated_localization/l10n.dart';
import 'package:presentation/screen/home/home_bloc.dart';
import 'package:presentation/screen/home/home_data.dart';

class HomeTabBar extends StatefulWidget {
  const HomeTabBar({
    required this.bloc,
    required this.data,
    required this.tabController,
    super.key,
  });

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
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: Responsive.isDesktop(context) ? Dimens.size400 : width,
      child: TabBar(
        controller: widget.tabController,
        splashBorderRadius: BorderRadius.circular(Dimens.size16),
        indicator: BoxDecoration(
          color: AppColorsDark.primaryColor,
          borderRadius: BorderRadius.circular(Dimens.size16),
        ),
        tabs: <Widget>[
          Tab(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                if (!isIconActive) const Icon(Icons.play_circle),
                const SizedBox(width: Dimens.size6),
                Text(
                  SM.current.nowShowing,
                  style: AppTextStyles.sfProMedium14px,
                ),
              ],
            ),
          ),
          Tab(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(width: Dimens.size6),
                Text(
                  SM.current.comingSoon,
                  style: AppTextStyles.sfProMedium14px,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
