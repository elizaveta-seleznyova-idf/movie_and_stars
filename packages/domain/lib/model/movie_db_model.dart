import 'package:domain/enum/movie_type.dart';
import 'package:domain/model/movie_response.dart';

class MovieDBModelField {
  MovieDBModelField._();

  static const String movieType = 'movieType';
  static const String title = 'title';
  static const String movieIdSlug = 'movieIdSlug';
  static const String movieIdImg = 'movieIdImg';
  static const String movieIdTmdb = 'movieIdTmdb';
  static const String overview = 'overview';
  static const String runtime = 'runtime';
  static const String rating = 'rating';
  static const String genres = 'genres';
  static const String certification = 'certification';
}

class MovieDBModel {
  const MovieDBModel({
    this.title,
    this.movieIdSlug,
    this.movieIdImdb,
    this.movieIdTmdb,
    this.overview,
    this.runtime,
    this.rating,
    this.genres,
    this.certification,
  });

  final String? title;
  final String? movieIdSlug;
  final String? movieIdImdb;
  final int? movieIdTmdb;
  final String? overview;
  final int? runtime;
  final double? rating;
  final List<String>? genres;
  final String? certification;

  static MovieDBModel fromResponse(MovieResponse movie) {
    return MovieDBModel(
      title: movie.movie.title,
      movieIdSlug: movie.movie.ids?.slug,
      movieIdImdb: movie.movie.ids?.imdb,
      movieIdTmdb: movie.movie.ids?.tmdb,
      overview: movie.movie.overview,
      runtime: movie.movie.runtime,
      rating: movie.movie.rating,
      genres: movie.movie.genres,
      certification: movie.movie.certification,
    );
  }

  factory MovieDBModel.fromJson(Map<String, dynamic> json) {
    return MovieDBModel(
      title: json['title'] as String?,
      movieIdSlug: json['ids']['slug'] as String?,
      movieIdImdb: json['ids']['imdb'] as String?,
      movieIdTmdb: json['ids']['tmdb'] as int?,
      overview: json['overview'] as String?,
      runtime: json['runtime'] as int?,
      rating: (json['rating'] as num?)?.toDouble(),
      genres: json['genres'].cast<String>(),
      certification: json['certification'] as String?,
    );
  }

  Map<String, dynamic> toJson(
    MovieDBModel model,
    MovieType type,
  ) =>
      {
        MovieDBModelField.movieType: type.name,
        MovieDBModelField.title: model.title,
        MovieDBModelField.movieIdImg: model.movieIdImdb,
        MovieDBModelField.movieIdSlug: model.movieIdSlug,
        MovieDBModelField.movieIdTmdb: model.movieIdTmdb.toString(),
        MovieDBModelField.runtime: model.runtime.toString(),
        MovieDBModelField.overview: model.overview,
        MovieDBModelField.rating: model.rating,
        MovieDBModelField.genres: model.genres.toString(),
        MovieDBModelField.certification: model.certification.toString(),
      };
}
