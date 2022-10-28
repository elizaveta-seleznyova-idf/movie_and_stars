import 'package:data/database/database_provider.dart';
import 'package:domain/model/cast_db_model.dart';
import 'package:domain/repository/cast_database_local_repository.dart';
import 'package:sqflite/sqflite.dart';

class CastDBLocalRepositoryImpl implements CastDBLocalRepository {
  CastDBLocalRepositoryImpl({required this.db});

  final Database db;

  @override
  Future<void> saveCastDB(
    List<CastDBModel> castDBModelList,
    String id,
  ) async {
    for (CastDBModel castModel in castDBModelList) {
      final storedCast = await db.query(
        DataBaseProvider.castTableName,
        where: 'person = ?',
        whereArgs: [castModel.person],
      );
      if (storedCast.isEmpty) {
        await db.insert(
          DataBaseProvider.castTableName,
          castModel.toJson(
            castModel,
            id,
          ),
        );
      }
    }
  }

  Future<List<CastDBModel>> getCastFromCache(String id) async {
    final List<Map<String, dynamic>> maps = await db.query(
        '${DataBaseProvider.castTableName} WHERE movieId = "$id"');

    return List.generate(maps.length, (i) {
      return CastDBModel(
        movieId: maps[i]['movieId'],
        characters: maps[i]['characters'],
        person: maps[i]['person'],
        image: maps[i]['image'],
      );
    });
  }

  Future<int> deleteCast(
    List<CastDBModel> castDBModelList,
    String id,
  ) async {
    return await db.delete(
      DataBaseProvider.castTableName,
      where: 'movieId = ?',
      whereArgs: [id],
    );
  }
}
