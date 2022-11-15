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
    Batch batch = db.batch();
    for (MovieDBModel movieModel in movieDBModelList) {
      final storedMovies = await db.query(
        DataBaseProvider.movieTableName,
        where: 'movieIdTmdb = ?',
        whereArgs: [movieModel.movieIdTmdb],
      );
      if (storedMovies.isEmpty) {
        batch.insert(
          DataBaseProvider.movieTableName,
          movieModel.toJson(
            movieModel,
            movieType,
          ),
        );
      }
    }
    await batch.commit();
  }

  @override
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

  Future<List<int>> getMoviesIdsFromCache(MovieType movieType) async {
    var tmdbFromDB = await db.rawQuery('SELECT movieIdTmdb FROM Movies');
    return List<int>.from(tmdbFromDB.map((i) => i["movieIdTmdb"]).toList())
        .toList();
  }

  Future<void> deleteByIds(
    List ids,
    MovieType movieType,
  ) async {
    Batch batch = db.batch();
    List<dynamic> args = [];
    if (ids.isNotEmpty) {
      args.addAll(ids);
      args.add(movieType.name);
      batch.delete(
        DataBaseProvider.movieTableName,
        where: '''
        "movieIdTmdb" in (${List.filled(ids.length - 1, '?').join(',')}) 
      and "movieType" = ?''',
        whereArgs: args,
      );
      await batch.commit();
    }
  }

  @override
  Future<void> updateMovieDB(
    List<MovieDBModel> movieDBModelList,
    MovieType movieType,
  ) async {
    final List<int> movieIdList = [];
    movieIdList.addAll(await getMoviesIdsFromCache(movieType));
    final List<int> moviesIdToDelete = movieIdList
        .where(
            (id) => movieDBModelList.where((e) => e.movieIdTmdb == id).isEmpty)
        .toList();
    if (moviesIdToDelete.isNotEmpty) {
      await deleteByIds(
        moviesIdToDelete,
        movieType,
      );
    }
    final List<MovieDBModel> moviesToAddToDB = movieDBModelList
        .where((movie) =>
            movieIdList.where((id) => movie.movieIdTmdb == id).isEmpty)
        .toList();
    if (moviesToAddToDB.isNotEmpty) {
      await saveMovieDB(
        moviesToAddToDB,
        movieType,
      );
    }
  }
}
