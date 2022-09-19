import 'package:flutter/material.dart';
import 'package:presentation/screen/home/home_bloc.dart';
import 'package:presentation/screen/home/widgets/movie_content.dart';
import 'package:presentation/screen/home/widgets/movie_image.dart';
import 'package:presentation/screen/home/widgets/movie_model.dart';
import 'package:presentation/screen/home/widgets/movie_rating.dart';
import 'package:presentation/screen/home/widgets/movie_title.dart';
import 'package:presentation/utils/extensions/extention_list.dart';

class HomeGridView extends StatelessWidget {
  HomeGridView({
    Key? key,
    required this.movieData,
    required this.blocFunctions,
  }) : super(key: key);

  final List<MovieModel> movieData;
  final HomeBloc blocFunctions;
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      key: _refreshIndicatorKey,
      onRefresh: () {
        return Future<void>.delayed(const Duration(seconds: 3));
      },
      child: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        itemCount: movieData.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 167 / 330,
          crossAxisCount: 2,
          crossAxisSpacing: 2.0,
        ),
        itemBuilder: (BuildContext context, int index) {
          final currentMovie = movieData[index];
          return InkWell(
            onTap: () {
              blocFunctions.navigateToDetailsPage(currentMovie);
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MovieImage(image: currentMovie.images),
                const SizedBox(height: 16),
                MovieRating(rating: currentMovie.rating),
                const SizedBox(height: 7),
                MovieTitle(
                  movieTitleText: currentMovie.titles,
                ),
                const SizedBox(height: 4),
                MovieContent(
                  movieGenre: currentMovie.genres.upperCaseFirstLetter(),
                  movieTime: currentMovie.time,
                  certification: currentMovie.certifications,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
