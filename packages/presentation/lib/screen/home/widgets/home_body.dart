import 'package:flutter/material.dart';
import 'package:presentation/config/theme/app_colors.dart';
import 'package:presentation/screen/home/home_bloc.dart';
import 'package:presentation/screen/home/home_data.dart';
import 'package:presentation/screen/home/widgets/home_grid_view.dart';
import 'package:presentation/screen/home/widgets/home_tab_bar.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({
    Key? key,
    required this.blocData,
    required this.bloc,
  }) : super(key: key);

  final HomeData blocData;
  final HomeBloc bloc;

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 40,
          margin: const EdgeInsets.only(
            top: 10,
            right: 18,
            left: 17,
            bottom: 24,
          ),
          padding: const EdgeInsets.all(4.0),
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColorsDark.borderTabBar,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(20),
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
                movieData: widget.blocData.trendingMovies,
                bloc: widget.bloc,
              ),
              HomeGridView(
                movieData: widget.blocData.anticipatedMovies,
                bloc: widget.bloc,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
