import 'package:presentation/screen/home/widgets/movie_model.dart';

class HomeData {
  HomeData({
    this.trendingMovies,
    this.anticipatedMovies,
  });

  List<MovieModel>? trendingMovies;
  List<MovieModel>? anticipatedMovies;

  factory HomeData.init() => HomeData(
        trendingMovies: [],
        anticipatedMovies: [],
      );

  HomeData copy() => HomeData(
        trendingMovies: trendingMovies,
        anticipatedMovies: anticipatedMovies,
      );
}
