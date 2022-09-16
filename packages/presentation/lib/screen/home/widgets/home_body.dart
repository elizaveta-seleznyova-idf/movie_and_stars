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

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
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
            child: const HomeTabBar(),
          ),
          Expanded(
            child: TabBarView(
              children: [
                HomeGridView(
                  movieData: widget.blocData.trendingMovies,
                  blocFunctions: widget.bloc,
                ),
                HomeGridView(
                  movieData: widget.blocData.anticipatedMovies,
                  blocFunctions: widget.bloc,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
