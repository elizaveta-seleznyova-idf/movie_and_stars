import 'package:domain/di/data_model.dart';
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

    void addToList(GetDataResponse responseWithItem) {
      jsonMovies.addAll(
        responseWithItem.body.map((e) => MovieResponse.fromJson(e)),
      );
    }

    final paginationCheck = int.parse(response.headers[C.pagination][0]);
    if (paginationCheck >= 5) {
      int itemCount = 50;

      if (type == MovieType.trending) {
        final responseWithItem = await _repository.getDataTrending(
          itemCount: itemCount,
        );
        addToList(responseWithItem);
      } else if (type == MovieType.anticipated) {
        final responseWithItem = await _repository.getDataAnticipated(
          itemCount: itemCount,
        );
        addToList(responseWithItem);
      }
    } else {
      final itemCount = paginationCheck;

      if (type == MovieType.trending) {
        final responseWithItem = await _repository.getDataTrending(
          itemCount: itemCount,
        );
        addToList(responseWithItem);
      } else if (type == MovieType.anticipated) {
        final responseWithItem = await _repository.getDataAnticipated(
          itemCount: itemCount,
        );
        addToList(responseWithItem);
      }
    }

    return jsonMovies;
  }
}
