import 'package:domain/model/movie.dart';

class MovieTrendingResponse {
  final int watchers;
  final Movie movie;

  MovieTrendingResponse(this.watchers, this.movie);

  factory MovieTrendingResponse.fromJson(Map<String, dynamic> json) {
    return MovieTrendingResponse(
      json['watchers'],
      Movie.fromJson(json['movie']),
    );
  }

  Map<String, dynamic> toJson(MovieTrendingResponse instance) =>
      <String, dynamic>{
        'watchers': instance.watchers,
        'movie': instance.movie.toJson(),
      };
}
