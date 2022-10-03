import 'package:domain/mappers/people_mapper.dart';
import 'package:domain/model/cast.dart';
import 'package:domain/model/people_and_images_model.dart';
import 'package:domain/model/people_response.dart';
import 'package:domain/model/tmdb_response.dart';
import 'package:domain/repository/tmdb_repository.dart';
import 'package:domain/repository/trakt_repository.dart';
import 'package:domain/use_case/use_case.dart';

class GetPeopleUseCase
    extends UseCaseParams<String, Future<List<PeopleAndImagesModel>>> {
  GetPeopleUseCase(
    this._traktRepository,
    this._tmdbRepository,
    this._peopleMapper,
  );

  final TRAKTRepository _traktRepository;
  final TMDBRepository _tmdbRepository;
  final PeopleMapper _peopleMapper;

  Future<List<TMDBResponse>> getCastImages(List<Cast> cast) async {
    return Future.wait(
      cast.map(
        (e) => _tmdbRepository.getCastImage(tMDBId: e.person?.ids?.tmdb),
      ),
    );
  }

  @override
  Future<List<PeopleAndImagesModel>> call(String params) async {
    const maxCastLength = 4;

    final PeopleResponse response =
        await _traktRepository.getCast(movieId: params);
    final List<Cast> responseCast = response.cast ?? [];
    final castLength = responseCast.length >= maxCastLength
        ? maxCastLength
        : responseCast.length;

    final finiteCast = responseCast.take(castLength).toList();

    final List<TMDBResponse> imageTMDBList = await getCastImages(finiteCast);

    return _peopleMapper(
      responseCast,
      imageTMDBList,
    );
  }
}
