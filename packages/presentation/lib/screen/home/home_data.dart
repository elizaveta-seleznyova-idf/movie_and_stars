import 'package:presentation/enum/home_tab_state.dart';
import 'package:presentation/screen/home/model/movie_model.dart';

class HomeData {
  const HomeData({
    required this.tabState,
    required this.trendingMovies,
    required this.anticipatedMovies,
  });

  final HomeTabState? tabState;
  final List<MovieModel> trendingMovies;
  final List<MovieModel> anticipatedMovies;

  factory HomeData.init() => const HomeData(
        trendingMovies: [],
        anticipatedMovies: [],
        tabState: HomeTabState.now,
      );

  HomeData copy() => HomeData(
        trendingMovies: trendingMovies,
        anticipatedMovies: anticipatedMovies,
        tabState: tabState,
      );

  HomeData copyWith({
    List<MovieModel>? trendingMovies,
    List<MovieModel>? anticipatedMovies,
    HomeTabState? tabState,
  }) =>
      HomeData(
        trendingMovies: trendingMovies ?? this.trendingMovies,
        anticipatedMovies: anticipatedMovies ?? this.anticipatedMovies,
        tabState: tabState ?? this.tabState,
      );
}
