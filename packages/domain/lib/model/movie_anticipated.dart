import 'package:domain/model/movie.dart';

class MovieAnticipatedResponse {
  final int listCount;
  final Movie movie;

  MovieAnticipatedResponse(this.listCount, this.movie);

  factory MovieAnticipatedResponse.fromJson(Map<String, dynamic> json) {
    return MovieAnticipatedResponse(
      json['list_count'],
      Movie.fromJson(json['movie']),
    );
  }

  Map<String, dynamic> toJson(MovieAnticipatedResponse instance) =>
      <String, dynamic>{
        'list_count': instance.listCount,
        'movie': instance.movie.toJson(),
      };
}
