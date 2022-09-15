import 'package:domain/use_case/get_anticipated_movies_use_case.dart';
import 'package:domain/use_case/get_trending_movies_use_case.dart';
import 'package:presentation/base/bloc.dart';
import 'package:presentation/screen/home/home_data.dart';
import 'package:presentation/screen/home/home_screen.dart';
import 'package:presentation/screen/home/widgets/movie_model.dart';
import 'package:presentation/screen/movie_details/movie_details_screen.dart';

abstract class HomeBloc extends Bloc<HomeScreenArguments, HomeData> {
  factory HomeBloc(
    GetTrendingMoviesUseCase getTrendingMoviesUseCase,
    GetAnticipatedMoviesUseCase getAnticipatedMoviesUseCase,
  ) =>
      HomeBlocImpl(
        getTrendingMoviesUseCase,
        getAnticipatedMoviesUseCase,
      );

  void navigateToDetailsPage(MovieModel movie);
}

class HomeBlocImpl extends BlocImpl<HomeScreenArguments, HomeData>
    implements HomeBloc {
  final GetTrendingMoviesUseCase _getTrendingMoviesUseCase;
  final GetAnticipatedMoviesUseCase _getAnticipatedMoviesUseCase;

  HomeData _stateData = HomeData.init();

  HomeBlocImpl(
    this._getTrendingMoviesUseCase,
    this._getAnticipatedMoviesUseCase,
  );

  @override
  void initState() async {
    super.initState();
    _updateData(data: _stateData, isLoading: true);
    final getTrendingMoviesUseCase = await _getTrendingMoviesUseCase();
    final getAnticipatedMoviesUseCase = await _getAnticipatedMoviesUseCase();
    final List<MovieModel> trendingMovies = getTrendingMoviesUseCase
        .map((e) => MovieModel.fromMovie(e.movie))
        .toList();
    final List<MovieModel> anticipatedMovies = getAnticipatedMoviesUseCase
        .map((e) => MovieModel.fromMovie(e.movie))
        .toList();
    _stateData = HomeData(
      trendingMovies: trendingMovies,
      anticipatedMovies: anticipatedMovies,
    );
    _updateData(data: _stateData, isLoading: false);
  }

  _updateData({HomeData? data, bool? isLoading}) {
    handleData(
      data: data,
      isLoading: isLoading,
    );
  }

  @override
  void initArgs(HomeScreenArguments arguments) {
    super.initArgs(arguments);
    _updateData();
  }

  @override
  void navigateToDetailsPage(MovieModel movie) {
    appNavigator.push(
      MovieDetailsScreen.page(
        MovieDetailsScreenArguments(
          movieInfo: movie,
        ),
      ),
    );
  }
}
