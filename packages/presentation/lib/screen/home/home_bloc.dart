import 'dart:async';

import 'package:collection/collection.dart';
import 'package:domain/enum/movie_type.dart';
import 'package:domain/model/movie_response.dart';
import 'package:domain/use_case/get_movies_use_case.dart';
import 'package:presentation/base/bloc.dart';
import 'package:presentation/enum/home_tab_state.dart';
import 'package:presentation/screen/home/home_data.dart';
import 'package:presentation/screen/home/home_screen.dart';
import 'package:presentation/screen/home/mapper/movie_mapper.dart';
import 'package:presentation/screen/movie_details/details_screen.dart';
import 'package:presentation/utils/analytics_constants.dart';

abstract class HomeBloc extends Bloc<HomeScreenArguments, HomeData> {
  factory HomeBloc(
    GetMoviesUseCase getTrendingMoviesUseCase,
    MapperMovie mapper,
  ) =>
      HomeBlocImpl(
        getTrendingMoviesUseCase,
        mapper,
      );

  void navigateToDetailsPage(String movieId);

  Future<void> refresh();

  void tabBarRequest(HomeTabState tabState);
}

class HomeBlocImpl extends BlocImpl<HomeScreenArguments, HomeData>
    implements HomeBloc {
  HomeBlocImpl(
    this._blocGetTrendingMoviesUseCase,
    this._mapper,
  );

  final GetMoviesUseCase _blocGetTrendingMoviesUseCase;
  final MapperMovie _mapper;

  HomeData _stateData = HomeData.init();
  List<MovieResponse>? _movies;

  @override
  void initState() async {
    super.initState();
    _updateData(data: _stateData);
  }

  _updateData({
    HomeData? data,
    bool? isLoading,
    bool? isBottomNavigationActive,
  }) {
    handleData(
      isBottomNavigationActive: isBottomNavigationActive,
      data: data,
      isLoading: isLoading,
    );
  }

  @override
  void initArgs(HomeScreenArguments arguments) {
    super.initArgs(arguments);
    _updateData(
      isBottomNavigationActive: true,
    );
  }

  @override
  void navigateToDetailsPage(String movieId) async {
    await logAnalyticsEventUseCase(
        AnalyticsEventConstants.eventHomePushToDetails);
    final movie =
        _movies?.firstWhereOrNull((e) => e.movie.ids?.slug == movieId)?.movie;
    if (movie != null) {
      appNavigator.push(
        DetailsScreen.page(
          DetailsScreenArguments(
            movieInfo: movie,
          ),
        ),
      );
    }
  }

  @override
  Future<void> refresh() async {
    return _stateData.tabState == HomeTabState.now
        ? _fetchTrendingMovies()
        : _fetchAnticipatedMovies();
  }

  @override
  void tabBarRequest(HomeTabState tabState) {
    if (tabState == HomeTabState.now) {
      _fetchTrendingMovies();
    } else if (tabState == HomeTabState.soon) {
      _fetchAnticipatedMovies();
    }
  }

  Future<void> _fetchTrendingMovies() async {
    await logAnalyticsEventUseCase(
        AnalyticsEventConstants.eventHomeTabBarTrending);
    _updateData(
      data: _stateData,
      isLoading: true,
      isBottomNavigationActive: false,
    );
    _stateData.copyWith(
      tabState: HomeTabState.now,
    );
    final listTrendingMovies =
        await _blocGetTrendingMoviesUseCase(MovieType.trending);
    _movies = listTrendingMovies;
    _stateData = _mapper.mapGetListTrendingResponse(
      listTrendingMovies,
      _stateData,
    );
    _updateData(
      data: _stateData,
      isLoading: false,
      isBottomNavigationActive: false,
    );
  }

  Future<void> _fetchAnticipatedMovies() async {
    await logAnalyticsEventUseCase(
        AnalyticsEventConstants.eventHomeTabBarAnticipated);
    _updateData(
      data: _stateData,
      isLoading: true,
      isBottomNavigationActive: false,
    );
    _stateData.copyWith(
      tabState: HomeTabState.soon,
    );
    final listAnticipatedMovies =
        await _blocGetTrendingMoviesUseCase(MovieType.anticipated);
    _movies = listAnticipatedMovies;
    _stateData = _mapper.mapGetListAnticipatedResponse(
      listAnticipatedMovies,
      _stateData,
    );
    _updateData(
      data: _stateData,
      isLoading: false,
      isBottomNavigationActive: false,
    );
  }
}
