import 'package:domain/model/movie.dart';

class MovieModel {
  final String? titles;
  final String? images;
  final String? time;
  final double? rating;
  final List<String>? genres;
  final String? certifications;

  MovieModel({
    this.titles,
    this.images,
    this.time,
    this.rating,
    this.genres,
    this.certifications,
  });

  factory MovieModel.fromMovie(Movie movie) {
    return MovieModel(
      titles: movie.title,
      images: 'http://img.omdbapi.com/?apikey=956febbc&i=${movie.image}',
      time: _getTimeString(movie.runtime),
      rating: (movie.rating ?? 0) / 2,
      genres: movie.genres,
      certifications: movie.certification ?? '',
    );
  }
}

String _getTimeString(int? value) {
  final int hour = (value ?? 0) ~/ 60;
  final int minutes = (value ?? 0) % 60;
  return '${hour.toString()}hr ${minutes.toString().padLeft(2, "0")}m';
}
