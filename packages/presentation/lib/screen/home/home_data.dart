import 'package:presentation/screen/home/enum/tab_state.dart';
import 'package:presentation/screen/home/model/movie_model.dart';

class HomeData {
  HomeData({
    required this.tabState,
    required this.trendingMovies,
    required this.anticipatedMovies,
  });

  final TabState? tabState;
  final List<MovieModel> trendingMovies;
  final List<MovieModel> anticipatedMovies;

  factory HomeData.init() => HomeData(
        trendingMovies: [],
        anticipatedMovies: [],
        tabState: TabState.now,
      );

  HomeData copy() => HomeData(
        trendingMovies: trendingMovies,
        anticipatedMovies: anticipatedMovies,
        tabState: tabState,
      );

  HomeData copyWith({
    List<MovieModel>? trendingMovies,
    List<MovieModel>? anticipatedMovies,
    TabState? tabState,
  }) =>
      HomeData(
        trendingMovies: trendingMovies ?? this.trendingMovies,
        anticipatedMovies: anticipatedMovies ?? this.anticipatedMovies,
        tabState: tabState ?? this.tabState,
      );
}
