import 'package:flutter/material.dart';
import 'package:presentation/base/bloc_data.dart';
import 'package:presentation/config/dimens/dimens.dart';
import 'package:presentation/config/theme/app_colors.dart';
import 'package:presentation/screen/home/enum/tab_state.dart';
import 'package:presentation/screen/home/home_bloc.dart';
import 'package:presentation/screen/home/home_data.dart';
import 'package:presentation/screen/home/widgets/home_grid_view.dart';
import 'package:presentation/screen/home/widgets/home_tab_bar.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({
    required this.blocData,
    required this.bloc,
    required this.data,
    super.key,
  });

  final BlocData<HomeData?> data;
  final HomeData blocData;
  final HomeBloc bloc;

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  static const int tabControllerLength = 2;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: tabControllerLength,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: Dimens.size40,
          margin: const EdgeInsets.only(
            top: Dimens.size10,
            right: Dimens.size18,
            left: Dimens.size17,
            bottom: Dimens.size24,
          ),
          padding: const EdgeInsets.all(Dimens.size4),
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColorsDark.borderTabBar,
              width: Dimens.size1,
            ),
            borderRadius: BorderRadius.circular(Dimens.size20),
          ),
          child: HomeTabBar(
            bloc: widget.bloc,
            data: widget.blocData,
            tabController: _tabController,
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              HomeGridView(
                data: widget.data,
                movieData: widget.blocData.trendingMovies,
                bloc: widget.bloc,
                tabState: TabState.now,
              ),
              HomeGridView(
                data: widget.data,
                movieData: widget.blocData.anticipatedMovies,
                bloc: widget.bloc,
                tabState: TabState.soon,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
