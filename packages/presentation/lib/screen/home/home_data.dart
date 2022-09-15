import 'package:domain/model/movie_anticipated.dart';
import 'package:domain/model/movie_trending.dart';

class HomeData {
  HomeData({
    required this.trendingMovies,
    required this.anticipatedMovies,
  });

  List<dynamic>? trendingMovies;
  List<dynamic>? anticipatedMovies;

  factory HomeData.init() => HomeData(
        trendingMovies: [],
        anticipatedMovies: [],
      );

  HomeData copy() => HomeData(
        trendingMovies: trendingMovies,
        anticipatedMovies: anticipatedMovies,
      );
}
