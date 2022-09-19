import 'package:domain/model/movie_trending.dart';
import 'package:domain/repository/base_repository.dart';
import 'package:domain/use_case/use_case.dart';
import 'package:domain/utils/const.dart';

class GetTrendingMoviesUseCase
    implements UseCase<Future<List<MovieTrendingResponse>>> {
  final NetworkRepository _repository;

  GetTrendingMoviesUseCase(this._repository);

  @override
  Future<List<MovieTrendingResponse>> call() async {
    final List<MovieTrendingResponse> jsonMovies = [];
    final response = await _repository.getDataTrending();
    final paginationCheck = int.parse(response.headers[C.pagination][0]);
    if (paginationCheck >= 5) {
      int itemCount = 50;
      final responseWithItem = await _repository.getDataTrending(
        itemCount: itemCount,
      );
      jsonMovies.addAll(
        responseWithItem.body.map((e) => MovieTrendingResponse.fromJson(e)),
      );
    } else {
      final itemCount = paginationCheck;
      final responseWithItem = await _repository.getDataTrending(
        itemCount: itemCount,
      );
      jsonMovies.addAll(
        responseWithItem.body.map((e) => MovieTrendingResponse.fromJson(e)),
      );
    }
    return jsonMovies;
  }
}
