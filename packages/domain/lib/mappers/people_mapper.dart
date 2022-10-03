import 'package:domain/mappers/base_mappers.dart';
import 'package:domain/model/cast.dart';
import 'package:domain/model/people_and_images_model.dart';
import 'package:domain/model/tmdb_response.dart';
import 'package:domain/utils/const.dart';

class PeopleMapper extends MapperTwoParams<List<Cast>,
    List<TMDBResponse>, List<PeopleAndImagesModel>> {
  @override
  List<PeopleAndImagesModel> call(
    List<Cast> params,
    List<TMDBResponse> paramsTwo,
  ) {
    if (params.isEmpty || paramsTwo.isEmpty) return List.empty();
    return paramsTwo.map(
      (e) {
        final Cast people = params.firstWhere(
          (element) {
            return element.person?.ids?.tmdb == e.id;
          },
        );
        return PeopleAndImagesModel(
          characters: people.characters?.first,
          person: people.person?.name,
          image: '${UrlConstants.tMDBImageUrl}'
              '${e.profiles?.first.filePath}',
        );
      },
    ).toList();
  }
}
