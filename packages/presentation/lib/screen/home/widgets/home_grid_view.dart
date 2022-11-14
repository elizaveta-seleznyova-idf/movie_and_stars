import 'package:flutter/material.dart';
import 'package:presentation/base/bloc_data.dart';
import 'package:presentation/config/dimens/dimens.dart';
import 'package:presentation/config/responsive/responsive.dart';
import 'package:presentation/enum/home_tab_state.dart';
import 'package:presentation/screen/home/home_bloc.dart';
import 'package:presentation/screen/home/home_data.dart';
import 'package:presentation/screen/home/model/movie_model.dart';
import 'package:presentation/screen/home/widgets/home_shimmer.dart';
import 'package:presentation/screen/home/widgets/movie_content.dart';
import 'package:presentation/screen/home/widgets/movie_image.dart';
import 'package:presentation/screen/home/widgets/movie_rating.dart';
import 'package:presentation/screen/home/widgets/movie_title.dart';

class HomeGridView extends StatefulWidget {
  const HomeGridView({
    required this.movieData,
    required this.bloc,
    required this.tabState,
    required this.data,
    super.key,
  });

  final List<MovieModel> movieData;
  final HomeBloc bloc;
  final HomeTabState tabState;
  final BlocData<HomeData?> data;

  @override
  State<HomeGridView> createState() => _HomeGridViewState();
}

class _HomeGridViewState extends State<HomeGridView> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();
    widget.bloc.tabBarRequest(widget.tabState);
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      key: _refreshIndicatorKey,
      onRefresh: () {
        return widget.bloc.refresh();
      },
      child: widget.data.isLoading
          ? const HomeShimmer()
          : GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: Dimens.size18),
              itemCount: widget.movieData.length,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: Dimens.size220,
                crossAxisSpacing: Dimens.size2W,
                mainAxisExtent: Responsive.isDesktop(context)
                    ? Dimens.size300
                    : Dimens.size355H,
              ),
              itemBuilder: (BuildContext context, int index) {
                final currentMovie = widget.movieData[index];
                return Padding(
                  padding: EdgeInsets.only(bottom: Dimens.size20H),
                  child: InkWell(
                    onTap: () {
                      widget.bloc.navigateToDetailsPage(currentMovie.movieId);
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MovieImage(image: currentMovie.images),
                        SizedBox(height: Dimens.size10H),
                        MovieRating(
                          rating: currentMovie.rating,
                          starsSize: Dimens.size17,
                        ),
                        SizedBox(height: Dimens.size8H),
                        MovieTitle(
                          movieTitleText: currentMovie.titles,
                        ),
                        SizedBox(height: Dimens.size4H),
                        MovieContent(
                          movieGenre: currentMovie.genres,
                          movieTime: currentMovie.time,
                          certification: currentMovie.certifications,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
