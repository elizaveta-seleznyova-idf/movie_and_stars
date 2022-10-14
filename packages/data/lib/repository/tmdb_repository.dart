import 'package:data/service/api_service.dart';
import 'package:data/service/service_payload.dart';
import 'package:data/utils/constants.dart';
import 'package:domain/model/tmdb_response.dart';
import 'package:domain/repository/tmdb_repository.dart';

class TmdbRepositoryImpl implements TmdbRepository {
  const TmdbRepositoryImpl(this._apiService);

  final ApiService<DioServicePayload> _apiService;

  @override
  Future<TmdbResponse> getCastImage({required int? tMDBId}) async {
    final tmbdResponseUrl =
        UrlConstants.constantUrlImageOfPeople(tMDBId: tMDBId);
    final response = await _apiService.get(
      tmbdResponseUrl,
    );
    return TmdbResponse.fromJson(response.data);
  }
}
