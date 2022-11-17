import 'package:domain/mappers/base_mapper.dart';
import 'package:domain/model/people_and_images_model.dart';

class PeopleMapper
    extends Mapper<List<Map<String, dynamic>>, List<PeopleAndImagesModel>?> {
  @override
  List<PeopleAndImagesModel>? call(List<Map<String, dynamic>> params) {
    return List.generate(params.length, (i) {
      return PeopleAndImagesModel(
        movieId: params[i]['movieId'],
        characters: params[i]['characters'],
        person: params[i]['person'],
        image: params[i]['image'],
      );
    });
  }
}
