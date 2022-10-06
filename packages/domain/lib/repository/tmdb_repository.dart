import 'package:domain/model/tmdb_response.dart';

abstract class TmdbRepository {
  Future<TmdbResponse> getCastImage({required int tMDBId});
}
