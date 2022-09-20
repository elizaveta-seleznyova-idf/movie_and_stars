import 'dart:async';
import 'package:domain/enum/movie_type.dart';
import 'package:domain/use_case/delay_use_case.dart';
import 'package:domain/use_case/get_movies_use_case.dart';
import 'package:presentation/base/bloc.dart';
import 'package:presentation/screen/home/enum/tab_state.dart';
import 'package:presentation/screen/home/home_data.dart';
import 'package:presentation/screen/home/home_screen.dart';
import 'package:presentation/screen/home/mapper/movie_mapper.dart';
import 'package:presentation/screen/home/model/movie_model.dart';
import 'package:presentation/screen/movie_details/movie_details_screen.dart';

abstract class HomeBloc extends Bloc<HomeScreenArguments, HomeData> {
  factory HomeBloc(
    GetMoviesUseCase getTrendingMoviesUseCase,
    DelayUseCase delayUseCase,
    MapperMovie mapper,
  ) =>
      HomeBlocImpl(
        getTrendingMoviesUseCase,
        delayUseCase,
        mapper,
      );

  void navigateToDetailsPage(MovieModel movie);

  Future<void> refresh();

  void tabBarRequest(TabState tabState);
}

class HomeBlocImpl extends BlocImpl<HomeScreenArguments, HomeData>
    implements HomeBloc {
  final GetMoviesUseCase _blocGetTrendingMoviesUseCase;
  final DelayUseCase _blocDelayUseCase;
  final MapperMovie _mapper;

  HomeData _stateData = HomeData.init();

  HomeBlocImpl(
    this._blocGetTrendingMoviesUseCase,
    this._blocDelayUseCase,
    this._mapper,
  );

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
  void navigateToDetailsPage(MovieModel movie) {
    appNavigator.push(
      MovieDetailsScreen.page(
        MovieDetailsScreenArguments(
          movieInfo: movie,
        ),
      ),
    );
  }

  @override
  Future<void> refresh() async {
    await _blocDelayUseCase();
    return _stateData.tabState == TabState.now
        ? _fetchTrendingMovies(isLoading: false)
        : _fetchAnticipatedMovies(isLoading: false);
  }

  @override
  void tabBarRequest(TabState tabState) {
    if (tabState == TabState.now) {
      _fetchTrendingMovies();
    } else if (tabState == TabState.soon) {
      _fetchAnticipatedMovies();
    }
  }

  Future<void> _fetchTrendingMovies({bool? isLoading = false}) async {
    _updateData(
      //data: _stateData,
      isLoading: true,
      isBottomNavigationActive: false,
    );
    _stateData.copyWith(
      tabState: TabState.now,
    );
    final listTrendingMovies =
        await _blocGetTrendingMoviesUseCase(MovieType.trending);
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

  Future<void> _fetchAnticipatedMovies({bool? isLoading = false}) async {
    _updateData(
      data: _stateData,
      isLoading: true,
      isBottomNavigationActive: false,
    );
    _stateData.copyWith(
      tabState: TabState.soon,
    );
    final listAnticipatedMovies =
        await _blocGetTrendingMoviesUseCase(MovieType.anticipated);
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
