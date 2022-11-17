import 'package:data/database/database_provider.dart';
import 'package:data/mapper/people_mapper.dart';
import 'package:domain/model/people_and_images_model.dart';
import 'package:domain/repository/cast_database_local_repository.dart';
import 'package:sqflite/sqflite.dart';

class CastDBLocalRepositoryImpl implements CastDBLocalRepository {
  const CastDBLocalRepositoryImpl({
    required this.db,
    required this.peopleMapper,
  });

  final Database db;
  final PeopleMapper peopleMapper;

  @override
  Future<void> saveCastDB(
    List<PeopleAndImagesModel> castDBModelList,
    String id,
  ) async {
    Batch batch = db.batch();
    for (PeopleAndImagesModel castModel in castDBModelList) {
      final storedCast = await db.query(
        DataBaseProvider.castTableName,
        where: 'person = ?',
        whereArgs: [castModel.person],
      );
      if (storedCast.isEmpty) {
        batch.insert(
          DataBaseProvider.castTableName,
          castModel.toJson(
            castModel,
            id,
          ),
        );
      }
    }
    await batch.commit();
  }

  @override
  Future<List<PeopleAndImagesModel>?> getCastFromCache(String id) async {
    final List<Map<String, dynamic>> maps = await db
        .query('${DataBaseProvider.castTableName} WHERE movieId = "$id"');

    return peopleMapper.call(maps);
  }

  Future<int> deleteCast(
    List<PeopleAndImagesModel> castDBModelList,
    String id,
  ) async {
    return await db.delete(
      DataBaseProvider.castTableName,
      where: 'movieId = ?',
      whereArgs: [id],
    );
  }
}
