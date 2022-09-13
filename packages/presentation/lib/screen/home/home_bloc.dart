import 'package:domain/usecase/get_anticipated_movies_use_case.dart';
import 'package:domain/usecase/get_trending_movies_use_case.dart';
import 'package:presentation/base/bloc.dart';
import 'package:presentation/screen/home/home_data.dart';
import 'package:presentation/screen/home/home_screen.dart';

abstract class HomeBloc extends Bloc<HomeScreenArguments, HomeData> {
  factory HomeBloc(
    GetTrendingMoviesUseCase getTrendingMoviesUseCase,
    GetAnticipatedMoviesUseCase getAnticipatedMoviesUseCase,
  ) =>
      HomeBlocImpl(
        getTrendingMoviesUseCase,
        getAnticipatedMoviesUseCase,
      );
}

class HomeBlocImpl extends BlocImpl<HomeScreenArguments, HomeData>
    implements HomeBloc {
  final GetTrendingMoviesUseCase _getTrendingMoviesUseCase;
  final GetAnticipatedMoviesUseCase _getAnticipatedMoviesUseCase;

  HomeData _stateData = HomeData.init();

  HomeBlocImpl(
      this._getTrendingMoviesUseCase, this._getAnticipatedMoviesUseCase);

  @override
  void initState() async {
    super.initState();
    final getTrendingMoviesUseCase = await _getTrendingMoviesUseCase();
    final getAnticipatedMoviesUseCase = await _getAnticipatedMoviesUseCase();
    _stateData = HomeData(
      trendingMovies: getTrendingMoviesUseCase,
      anticipatedMovies: getAnticipatedMoviesUseCase,
    );
    _updateData(data: _stateData);
  }

  _updateData({HomeData? data}) {
    handleData(
      data: data,
    );
  }
}
