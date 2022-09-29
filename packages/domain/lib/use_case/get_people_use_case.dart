import 'package:domain/model/cast.dart';
import 'package:domain/model/people_and_images_model.dart';
import 'package:domain/model/people_response.dart';
import 'package:domain/model/tmdb_response.dart';
import 'package:domain/repository/general_repository.dart';
import 'package:domain/repository/tmdb_repository.dart';
import 'package:domain/use_case/use_case.dart';
import 'package:domain/utils/const.dart';

class GetPeopleUseCase
    extends UseCaseParams<String, Future<List<PeopleAndImagesModel>>> {
  final TRAKTRepository _generalRepository;
  final TMDBRepository _tMDBRepository;

  GetPeopleUseCase(this._generalRepository, this._tMDBRepository);

  Future<List<TMDBResponse>> getCastImages(List<Cast> cast) async {
    return Future.wait(
      cast.map(
        (e) => _tMDBRepository.getCastImage(tMDBId: e.person?.ids?.tmdb),
      ),
    );
  }

  @override
  Future<List<PeopleAndImagesModel>> call(String? params) async {
    const maxCastLength = 4;

    final PeopleResponse response =
        await _generalRepository.getCast(movieId: params);
    final List<Cast> responseCast = response.cast ?? [];
    final castLength = responseCast.length >= maxCastLength
        ? maxCastLength
        : responseCast.length;

    final finiteCast = responseCast.take(castLength).toList();

    final List<TMDBResponse> imageTMDBList = await getCastImages(finiteCast);

    return imageTMDBList.map(
      (e) {
        final Cast people = responseCast.firstWhere(
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
