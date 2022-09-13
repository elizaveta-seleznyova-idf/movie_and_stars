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
    final response = await _repository.getData(
      apiPath: '${C.movieUrl}${C.trendingUrl}',
    );

    if (int.parse(response.headers['x-pagination-page-count'][0]) >= 5) {
      int itemCount = 50;
      final responseWithItem = await _repository.getData(
        apiPath: '${C.movieUrl}${C.trendingUrl}',
        itemCount: itemCount,
      );
      jsonMovies.addAll(
        responseWithItem.body.map((e) => MovieTrendingResponse.fromJson(e)),
      );
    } else {
      final itemCount =
          int.parse(response.headers['x-pagination-item-count'][0]);
      final responseWithItem = await _repository.getData(
        apiPath: '${C.movieUrl}${C.trendingUrl}',
        itemCount: itemCount,
      );
      jsonMovies.addAll(
        responseWithItem.body.map((e) => MovieTrendingResponse.fromJson(e)),
      );
    }
    return jsonMovies;
  }
}
