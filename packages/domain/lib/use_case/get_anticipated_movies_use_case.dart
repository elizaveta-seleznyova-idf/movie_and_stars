import 'package:domain/model/movie_anticipated.dart';
import 'package:domain/repository/base_repository.dart';
import 'package:domain/use_case/use_case.dart';
import 'package:domain/utils/const.dart';

class GetAnticipatedMoviesUseCase
    implements UseCase<Future<List<MovieAnticipatedResponse>>> {
  final NetworkRepository _repository;

  GetAnticipatedMoviesUseCase(this._repository);

  @override
  Future<List<MovieAnticipatedResponse>> call() async {
    final List<MovieAnticipatedResponse> jsonMovies = [];
    final response = await _repository.getDataAnticipated();
    final paginationCheck = int.parse(response.headers[C.pagination][0]);
    if (paginationCheck >= 5) {
      int itemCount = 50;
      final responseWithItem = await _repository.getDataAnticipated(
        itemCount: itemCount,
      );
      jsonMovies.addAll(responseWithItem.body
          .map((e) => MovieAnticipatedResponse.fromJson(e)));
    } else {
      final itemCount = paginationCheck;
      final responseWithItem = await _repository.getDataAnticipated(
        itemCount: itemCount,
      );
      jsonMovies.addAll(responseWithItem.body
          .map((e) => MovieAnticipatedResponse.fromJson(e)));
    }
    return jsonMovies;
  }
}
