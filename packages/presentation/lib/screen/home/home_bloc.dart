import 'package:domain/use_case/delay_use_case.dart';
import 'package:domain/use_case/get_anticipated_movies_use_case.dart';
import 'package:domain/use_case/get_trending_movies_use_case.dart';
import 'package:presentation/base/bloc.dart';
import 'package:presentation/screen/home/home_data.dart';
import 'package:presentation/screen/home/home_screen.dart';
import 'package:presentation/screen/home/mapper/movie_mapper.dart';
import 'package:presentation/screen/home/widgets/movie_model.dart';
import 'package:presentation/screen/movie_details/movie_details_screen.dart';

abstract class HomeBloc extends Bloc<HomeScreenArguments, HomeData> {
  factory HomeBloc(
    GetTrendingMoviesUseCase getTrendingMoviesUseCase,
    GetAnticipatedMoviesUseCase getAnticipatedMoviesUseCase,
    DelayUseCase delayUseCase,
    MapperMovie mapper,
  ) =>
      HomeBlocImpl(
        getTrendingMoviesUseCase,
        getAnticipatedMoviesUseCase,
        delayUseCase,
        mapper,
      );

  void navigateToDetailsPage(MovieModel movie);

  Future<void> refresh();
}

class HomeBlocImpl extends BlocImpl<HomeScreenArguments, HomeData>
    implements HomeBloc {
  final GetTrendingMoviesUseCase _blocGetTrendingMoviesUseCase;
  final GetAnticipatedMoviesUseCase _blocGetAnticipatedMoviesUseCase;
  final DelayUseCase _blocDelayUseCase;
  final MapperMovie _mapper;

  HomeData _stateData = HomeData.init();

  HomeBlocImpl(
    this._blocGetTrendingMoviesUseCase,
    this._blocGetAnticipatedMoviesUseCase,
    this._blocDelayUseCase,
    this._mapper,
  );

  @override
  void initState() async {
    super.initState();
    _updateData();
    getInitData();
  }

  _updateData(
      {HomeData? data, bool? isLoading, bool? isBottomNavigationActive}) {
    handleData(
      isBottomNavigationActive: isBottomNavigationActive,
      data: data,
      isLoading: isLoading,
    );
  }

  getInitData() async {
    _updateData(
      data: _stateData,
      isLoading: true,
      isBottomNavigationActive: false,
    );
    final listTrendingMovies = await _blocGetTrendingMoviesUseCase();
    _stateData = _mapper.mapGetListTrendingResponse(
      listTrendingMovies,
      _stateData,
    );
    final listAnticipatedMovies = await _blocGetAnticipatedMoviesUseCase();
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
  }
}
