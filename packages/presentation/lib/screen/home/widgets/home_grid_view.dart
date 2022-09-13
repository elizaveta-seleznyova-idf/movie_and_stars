import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:presentation/config/theme/app_colors.dart';
import 'package:presentation/screen/home/widgets/movie_content.dart';
import 'package:presentation/screen/home/widgets/movie_rating.dart';
import 'package:presentation/screen/home/widgets/movie_title.dart';
import 'package:presentation/screen/movie_details/movie_details_screen.dart';

import 'package:presentation/utils/image_path.dart';

class HomeGridView extends StatelessWidget {
  const HomeGridView({
    Key? key,
    required this.nowShowingData,
  }) : super(key: key);

  final nowShowingData;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      itemCount: nowShowingData?.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 167 / 330,
        crossAxisCount: 2,
        crossAxisSpacing: 2.0,
      ),
      itemBuilder: (BuildContext context, int index) {
        final currentMovie = nowShowingData[index];
        final images = currentMovie?.movie.image;
        final titles = currentMovie?.movie.title;
        final genres = currentMovie?.movie.genres;
        final int times = currentMovie?.movie.runtime;
        final certifications = currentMovie?.movie.certification;
        final rating = currentMovie?.movie.rating;
        String getTimeString(int value) {
          final int hour = value ~/ 60;
          final int minutes = value % 60;
          return '${hour.toString()}hr ${minutes.toString().padLeft(2, "0")}m';
        }

        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const MovieDetailsScreen()),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                'http://img.omdbapi.com/?apikey=956febbc&i=$images',
                fit: BoxFit.fill,
                width: 167,
                height: 250,
                errorBuilder: (context, exception, stackTrace) =>
                    SvgPicture.asset(
                  ImagesPath.noImage,
                  height: 250,
                  width: 167,
                  fit: BoxFit.fill,
                  color: AppColorsDark.unselectedColor,
                ),
              ),
              const SizedBox(height: 16),
              MovieRating(rating: rating),
              const SizedBox(height: 7),
              MovieTitle(
                movieTitleText: titles,
              ),
              const SizedBox(height: 4),
              MovieContent(
                movieGenre: genres.first.substring(0, 1).toUpperCase() +
                    genres.first.substring(1),
                movieTime: getTimeString(times),
                certification: certifications ?? '',
              ),
            ],
          ),
        );
      },
    );
  }
}
