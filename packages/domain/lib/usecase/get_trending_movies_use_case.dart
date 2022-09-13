import 'package:domain/model/movie_trending.dart';
import 'package:domain/repository/base_repository.dart';
import 'package:domain/usecase/use_case.dart';
import 'package:domain/utils/const.dart';

class GetTrendingMoviesUseCase
    implements UseCase<Future<List<MovieTrendingResponse>>> {
  final NetworkRepository _repository;

  GetTrendingMoviesUseCase(this._repository);

  @override
  Future<List<MovieTrendingResponse>> call() async {
    final List<MovieTrendingResponse> jsonMovies = [];
    final response = await _repository.getHttp(
      '${C.movieUrl}${C.trendingUrl}',
    );
    jsonMovies.addAll(
      response.body.map((e) => MovieTrendingResponse.fromJson(e)),
    );
    return jsonMovies;
  }
}
