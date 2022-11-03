import 'package:domain/model/people_and_images_model.dart';

abstract class CastDBLocalRepository {
  Future<void> saveCastDB(
    List<PeopleAndImagesModel> castDBModelList,
    String id,
  );

  Future<List<PeopleAndImagesModel>?> getCastFromCache(String id);
}
