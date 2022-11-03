import 'package:domain/enum/movie_type.dart';
import 'package:domain/model/data_model.dart';
import 'package:domain/model/movie_db_model.dart';
import 'package:domain/model/movie_response.dart';
import 'package:domain/repository/movie_database_local_repository.dart';
import 'package:domain/repository/preference_local_repository.dart';
import 'package:domain/repository/trakt_repository.dart';
import 'package:domain/use_case/use_case.dart';
import 'package:domain/utils/const.dart';

class GetMoviesUseCase
    implements UseCaseParams<MovieType, Future<List<MovieDBModel>>> {
  const GetMoviesUseCase(
    this._traktRepository,
    this._localRepository,
    this._preferences,
  );

  final TraktRepository _traktRepository;
  final MovieDBLocalRepository _localRepository;
  final PreferencesLocalRepository _preferences;

  @override
  Future<List<MovieDBModel>> call(MovieType type) async {
    final List<MovieResponse> jsonMovies = [];
    final List<MovieDBModel> cachedMovies =
        await _localRepository.getMovieFromCache(type);

    final GetDataResponse response = type == MovieType.trending
        ? await _traktRepository.getDataTrending()
        : await _traktRepository.getDataAnticipated();

    void addToList(GetDataResponse responseWithItem) {
      jsonMovies.addAll(
        responseWithItem.body.map((e) => MovieResponse.fromJson(e)),
      );
    }

    final paginationCheck =
        int.parse(response.headers[UrlConstantsDomain.pagination][0]);

    final String dateResponse = response.headers['date'][0];
    final checkData = await _preferences.saveDate(dateResponse);
    if (checkData == true){
      if (paginationCheck >= 5) {
        int itemCount = 50;

        if (type == MovieType.trending) {
          final responseWithItem = await _traktRepository.getDataTrending(
            itemCount: itemCount,
          );
          addToList(responseWithItem);
        } else if (type == MovieType.anticipated) {
          final responseWithItem = await _traktRepository.getDataAnticipated(
            itemCount: itemCount,
          );
          addToList(responseWithItem);
        }
      } else {
        final itemCount = paginationCheck;

        if (type == MovieType.trending) {
          final responseWithItem = await _traktRepository.getDataTrending(
            itemCount: itemCount,
          );
          addToList(responseWithItem);
        } else if (type == MovieType.anticipated) {
          final responseWithItem = await _traktRepository.getDataAnticipated(
            itemCount: itemCount,
          );
          addToList(responseWithItem);
        }
      }

      jsonMovies.forEach((element) {
        cachedMovies.add(MovieDBModel.fromResponse(element));
      });
      _localRepository.saveMovieDB(
        cachedMovies,
        type,
      );
    }
    return cachedMovies;
  }
}
