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
        await _repository.getHttp('${C.movieUrl}${C.anticipatedUrl}');
    jsonMovies.addAll(
      response.body.map((e) => MovieAnticipatedResponse.fromJson(e)),
    );
    return jsonMovies;
  }
}
