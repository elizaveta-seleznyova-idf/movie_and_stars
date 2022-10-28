import 'package:data/database/database_provider.dart';
import 'package:domain/enum/movie_type.dart';
import 'package:domain/model/movie_db_model.dart';
import 'package:domain/repository/movie_database_local_repository.dart';
import 'package:sqflite/sqflite.dart';

class MovieDBLocalRepositoryImpl implements MovieDBLocalRepository {
  const MovieDBLocalRepositoryImpl({required this.db});

  final Database db;

  @override
  Future<void> saveMovieDB(
    List<MovieDBModel> movieDBModelList,
    MovieType movieType,
  ) async {
    for (MovieDBModel movieModel in movieDBModelList) {
      final storedMovies = await db.query(
        DataBaseProvider.movieTableName,
        where: 'movieIdTmdb = ?',
        whereArgs: [movieModel.movieIdTmdb],
      );
      if (storedMovies.isEmpty) {
        await db.insert(
          DataBaseProvider.movieTableName,
          movieModel.toJson(
            movieModel,
            movieType,
          ),
        );
      }
    }
  }

  Future<List<MovieDBModel>> getMovieFromCache(MovieType movieType) async {
    final List<Map<String, dynamic>> maps = await db.query(
        '${DataBaseProvider.movieTableName} WHERE movieType = "${movieType.name}"');
    return List.generate(maps.length, (i) {
      return MovieDBModel(
        title: maps[i]['title'],
        movieIdSlug: maps[i]['movieIdSlug'],
        movieIdImdb: maps[i]['movieIdImdb'],
        movieIdTmdb: maps[i]['movieIdTmdb'],
        overview: maps[i]['overview'],
        runtime: maps[i]['runtime'],
        rating: maps[i]['rating'],
        genres: maps[i]['genres'].split(','),
        certification: maps[i]['certification'],
      );
    });
  }
}
