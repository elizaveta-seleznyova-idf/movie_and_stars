import 'package:domain/enum/movie_type.dart';
import 'package:domain/model/movie_db_model.dart';

abstract class MovieDBLocalRepository {
  Future<void> saveMovieDB(
    List<MovieDBModel> movieDBModelList,
    MovieType movieType,
  );

  Future<List<MovieDBModel>> getMovieFromCache(MovieType movieType);
}
