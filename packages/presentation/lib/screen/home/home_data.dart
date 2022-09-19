import 'package:presentation/screen/home/widgets/movie_model.dart';

class HomeData {
  HomeData({
    required this.trendingMovies,
    required this.anticipatedMovies,
  });

  List<MovieModel> trendingMovies;
  List<MovieModel> anticipatedMovies;

  factory HomeData.init() => HomeData(
        trendingMovies: [],
        anticipatedMovies: [],
      );

  HomeData copy() => HomeData(
        trendingMovies: trendingMovies,
        anticipatedMovies: anticipatedMovies,
      );

  HomeData copyWith({
    List<MovieModel>? trendingMovies,
    List<MovieModel>? anticipatedMovies,
  }) =>
      HomeData(
        trendingMovies: trendingMovies ?? this.trendingMovies,
        anticipatedMovies: anticipatedMovies ?? this.anticipatedMovies,
      );
}
