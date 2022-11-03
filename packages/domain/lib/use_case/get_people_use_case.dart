import 'package:domain/model/cast.dart';
import 'package:domain/model/people_and_images_model.dart';
import 'package:domain/model/people_response.dart';
import 'package:domain/model/tmdb_response.dart';
import 'package:domain/repository/cast_database_local_repository.dart';
import 'package:domain/repository/tmdb_repository.dart';
import 'package:domain/repository/trakt_repository.dart';
import 'package:domain/use_case/use_case.dart';
import 'package:domain/utils/const.dart';

class GetPeopleUseCase
    extends UseCaseParams<String, Future<List<PeopleAndImagesModel>?>> {
  GetPeopleUseCase(
    this._traktRepository,
    this._tmdbRepository,
    this._localRepository,
  );

  final TraktRepository _traktRepository;
  final TmdbRepository _tmdbRepository;
  final CastDBLocalRepository _localRepository;

  @override
  Future<List<PeopleAndImagesModel>?> call(String params) async {
    final PeopleResponse response =
        await _traktRepository.getCast(movieId: params);
    final List<PeopleAndImagesModel>? cachedCast =
        await _localRepository.getCastFromCache(params);
    if (cachedCast != null && cachedCast.isEmpty) {
      final List<Cast>? responseCast = response.cast;

      final List<Future<PeopleAndImagesModel>>? castAndImagesFutureList =
          responseCast?.map((e) async {
        final TmdbResponse filePath = await _tmdbRepository.getCastImage(
            tMDBId: e.person?.ids?.tmdb ?? 0);

        final String? url = filePath.profiles?.isNotEmpty == true
            ? UrlConstantsDomain.getCastImagePath(
                filePath.profiles![0].filePath.toString(),
              )
            : null;

        return PeopleAndImagesModel(
          movieId: params,
          characters: e.character,
          person: e.person?.name,
          image: url,
        );
      }).toList();

      final List<PeopleAndImagesModel> peopleAndImagesList =
          await Future.wait(castAndImagesFutureList ?? []);

      _localRepository.saveCastDB(
        peopleAndImagesList,
        params,
      );
    } else {
      return cachedCast;
    }
  }
}
