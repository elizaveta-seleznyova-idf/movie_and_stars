import 'package:domain/model/movie.dart';

class MovieResponse {
  const MovieResponse(
    this.watchers,
    this.listCount,
    this.movie,
  );

  final int? watchers;
  final int? listCount;
  final Movie movie;

  factory MovieResponse.fromJson(Map<String, dynamic> json) {
    return MovieResponse(
      json['watchers'],
      json['listCount'],
      Movie.fromJson(json['movie']),
    );
  }

  Map<String, dynamic> toJson(MovieResponse instance) => <String, dynamic>{
        'watchers': instance.watchers,
        'listCount': instance.listCount,
        'movie': instance.movie.toJson(),
      };
}
