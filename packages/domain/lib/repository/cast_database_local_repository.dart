import 'package:domain/model/cast_db_model.dart';

abstract class CastDBLocalRepository {
  Future<void> saveCastDB(
    List<CastDBModel> castDBModelList,
    String id,
  );

  Future<List<CastDBModel>> getCastFromCache(String id);
}
