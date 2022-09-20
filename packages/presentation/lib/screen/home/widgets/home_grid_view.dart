import 'package:flutter/material.dart';
import 'package:presentation/screen/home/home_bloc.dart';
import 'package:presentation/screen/home/widgets/movie_content.dart';
import 'package:presentation/screen/home/widgets/movie_image.dart';
import 'package:presentation/screen/home/widgets/movie_model.dart';
import 'package:presentation/screen/home/widgets/movie_rating.dart';
import 'package:presentation/screen/home/widgets/movie_title.dart';
import 'package:presentation/utils/extensions/extention_list.dart';

class HomeGridView extends StatefulWidget {
  const HomeGridView({
    Key? key,
    required this.movieData,
    required this.bloc,
  }) : super(key: key);

  final List<MovieModel> movieData;
  final HomeBloc bloc;

  @override
  State<HomeGridView> createState() => _HomeGridViewState();
}

class _HomeGridViewState extends State<HomeGridView> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      key: _refreshIndicatorKey,
      onRefresh: () {
        return widget.bloc.refresh();
      },
      child: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        itemCount: widget.movieData.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 167 / 320,
          crossAxisCount: 2,
          crossAxisSpacing: 2.0,
        ),
        itemBuilder: (BuildContext context, int index) {
          final currentMovie = widget.movieData[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: InkWell(
              onTap: () {
                widget.bloc.navigateToDetailsPage(currentMovie);
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MovieImage(image: currentMovie.images),
                  const Spacer(),
                  MovieRating(rating: currentMovie.rating),
                  const Spacer(),
                  MovieTitle(
                    movieTitleText: currentMovie.titles,
                  ),
                  const Spacer(),
                  MovieContent(
                    movieGenre: currentMovie.genres.upperCaseFirstLetter(),
                    movieTime: currentMovie.time,
                    certification: currentMovie.certifications,
                  ),
                  const Spacer(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
