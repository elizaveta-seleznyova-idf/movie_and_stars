import 'package:domain/model/movie_anticipated.dart';
import 'package:domain/repository/base_repository.dart';
import 'package:domain/usecase/use_case.dart';
import 'package:domain/utils/const.dart';

class GetAnticipatedMoviesUseCase
    implements UseCase<Future<List<MovieAnticipatedResponse>>> {
  final NetworkRepository _repository;

  GetAnticipatedMoviesUseCase(this._repository);

  @override
  Future<List<MovieAnticipatedResponse>> call() async {
    final List<MovieAnticipatedResponse> jsonMovies = [];
    final response =
        await _repository.getData(apiPath: '${C.movieUrl}${C.anticipatedUrl}');

    if (int.parse(response.headers['x-pagination-page-count'][0]) >= 5) {
      int itemCount = 50;
      final responseWithItem = await _repository.getData(
        apiPath: '${C.movieUrl}${C.anticipatedUrl}',
        itemCount: itemCount,
      );
      jsonMovies.addAll(responseWithItem.body
          .map((e) => MovieAnticipatedResponse.fromJson(e)));
    } else {
      final itemCount =
          int.parse(response.headers['x-pagination-item-count'][0]);
      final responseWithItem = await _repository.getData(
        apiPath: '${C.movieUrl}${C.anticipatedUrl}',
        itemCount: itemCount,
      );
      jsonMovies.addAll(responseWithItem.body
          .map((e) => MovieAnticipatedResponse.fromJson(e)));
    }
    return jsonMovies;
  }
}