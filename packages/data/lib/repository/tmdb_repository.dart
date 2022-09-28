import 'package:data/service/api_base_service.dart';
import 'package:data/service/service_payload.dart';
import 'package:data/utils/api_key_data.dart';
import 'package:data/utils/constants.dart';
import 'package:domain/model/tmdb_response.dart';
import 'package:domain/repository/tmdb_repository.dart';

class TMDBRepositoryImpl implements TMDBRepository {
  final ApiBaseService<ServicePayload> _apiService;

  TMDBRepositoryImpl(this._apiService);

  @override
  Future<TMDBResponse> getCastImage({required int? tMDBId}) async {
    final response = await _apiService.get(
      '${C.personUrl}/$tMDBId${C.imagesUrl}',
      queryParameters: {Q.apiKey: ApiKeyData.apiKeyTMDB},
      isTrakt: false,
    );
    return TMDBResponse.fromJson(response.data);
  }
}
