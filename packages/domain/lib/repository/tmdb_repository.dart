import 'package:domain/model/tmdb_response.dart';

abstract class TMDBRepository {
  Future<TMDBResponse> getCastImage({required int? tMDBId});
}
