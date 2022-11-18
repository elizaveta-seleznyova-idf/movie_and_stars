import 'package:domain/model/movie_db_model.dart';
import 'package:domain/model/people_and_images_model.dart';
import 'package:domain/model/time_db_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseProvider {
  static final DataBaseProvider instance = DataBaseProvider._init();

  static const String dbName = 'movie_list.db';
  static const String movieTableName = 'Movies';
  static const String castTableName = 'Cast';
  static const String dateTimeTableName = 'DateTime';
  static const int dbVersion = 1;
  static Database? _database;

  DataBaseProvider._init();

  Future<Database> get database async {
    if (_database != null) _database = await _initDB(dbName);

    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final String path = join(
      dbPath,
      filePath,
    );
    return await openDatabase(
      path,
      version: dbVersion,
      onCreate: onCreateDB,
    );
  }

  Future<void> onCreateDB(
    Database db,
    int version,
  ) async {
    const textType = 'TEXT';
    const doubleType = 'DOUBLE';
    const intType = 'INTEGER';

    await db.execute('''
      CREATE TABLE IF NOT EXISTS $movieTableName (
       ${MovieDBModelField.movieType} $textType,
       ${MovieDBModelField.title} $textType,
       ${MovieDBModelField.movieIdImg} $textType,
       ${MovieDBModelField.movieIdSlug} $textType,
       ${MovieDBModelField.movieIdTmdb} $intType PRIMARY KEY,
       ${MovieDBModelField.overview} $intType,
       ${MovieDBModelField.runtime} $intType,
       ${MovieDBModelField.rating} $doubleType,
       ${MovieDBModelField.genres} $textType,
       ${MovieDBModelField.certification} $textType
      )
      ''');

    await db.execute('''
      CREATE TABLE IF NOT EXISTS $castTableName (
       ${CastDBModelField.movieId} $textType PRIMARY KEY,
       ${CastDBModelField.characters} $textType,
       ${CastDBModelField.person} $textType,
       ${CastDBModelField.image} $textType,
       FOREIGN KEY (movieId) REFERENCES Movies(movieIdTmdb) ON DELETE CASCADE
      )
      ''');

    await db.execute('''
       CREATE TABLE IF NOT EXISTS $dateTimeTableName (
       ${TimeDBModelField.movieType} $textType,
       ${TimeDBModelField.dateTime} $intType,
       )''');
  }
}
