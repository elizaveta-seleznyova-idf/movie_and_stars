import 'package:domain/enum/movie_type.dart';
import 'package:domain/model/movie_response.dart';
import 'package:domain/repository/base_repository.dart';
import 'package:domain/use_case/use_case.dart';
import 'package:domain/utils/const.dart';

class GetMoviesUseCase
    implements UseCaseParams<MovieType, Future<List<MovieResponse>>> {
  final NetworkRepository _repository;

  GetMoviesUseCase(this._repository);

  @override
  Future<List<MovieResponse>> call(MovieType type) async {
    final List<MovieResponse> jsonMovies = [];
    final response = type == MovieType.trending
        ? await _repository.getDataTrending()
        : await _repository.getDataAnticipated();

    final paginationCheck = int.parse(response.headers[C.pagination][0]);
    if (paginationCheck >= 5) {
      int itemCount = 50;

      if (type == MovieType.trending) {
        final responseWithItem = await _repository.getDataTrending(
          itemCount: itemCount,
        );
        jsonMovies.addAll(
          responseWithItem.body.map((e) => MovieResponse.fromJson(e)),
        );
      } else if (type == MovieType.anticipated) {
        final responseWithItem = await _repository.getDataAnticipated(
          itemCount: itemCount,
        );
        jsonMovies.addAll(
            responseWithItem.body.map((e) => MovieResponse.fromJson(e)));
      }
    } else {
      final itemCount = paginationCheck;

      if (type == MovieType.trending) {
        final responseWithItem = await _repository.getDataTrending(
          itemCount: itemCount,
        );
        jsonMovies.addAll(
          responseWithItem.body.map((e) => MovieResponse.fromJson(e)),
        );
      } else if (type == MovieType.anticipated) {
        final responseWithItem = await _repository.getDataAnticipated(
          itemCount: itemCount,
        );
        jsonMovies.addAll(
            responseWithItem.body.map((e) => MovieResponse.fromJson(e)));
      }
    }
    return jsonMovies;
  }
}
