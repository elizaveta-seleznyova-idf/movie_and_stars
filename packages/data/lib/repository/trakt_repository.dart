import 'package:data/service/api_service.dart';
import 'package:data/service/service_payload.dart';
import 'package:data/utils/constants.dart';
import 'package:domain/model/data_model.dart';
import 'package:domain/model/people_response.dart';
import 'package:domain/repository/trakt_repository.dart';

class TRAKTRepositoryImpl implements TRAKTRepository {
  final ApiService<ServicePayload> _apiService;

  const TRAKTRepositoryImpl(this._apiService);

  @override
  Future<GetDataResponse> getDataTrending({int? itemCount}) async {
    return _apiService
        .get(
      UrlConstants.trendingFullUrl,
      queryParameters: {
        QueryParametersConstants.extended: QueryParametersConstants.full,
        QueryParametersConstants.limit: itemCount,
      },
      isTrakt: true,
    )
        .then(
      (response) {
        return GetDataResponse(
          headers: response.headers.map,
          body: (response.data as List<dynamic>)
              .map((e) => e as Map<String, dynamic>)
              .toList(),
        );
      },
    );
  }

  @override
  Future<GetDataResponse> getDataAnticipated({int? itemCount}) async {
    return _apiService
        .get(
      UrlConstants.anticipatedFullUrl,
      queryParameters: {
        QueryParametersConstants.extended: QueryParametersConstants.full,
        QueryParametersConstants.limit: itemCount,
      },
      isTrakt: true,
    )
        .then(
      (response) {
        return GetDataResponse(
          headers: response.headers.map,
          body: (response.data as List<dynamic>)
              .map((e) => e as Map<String, dynamic>)
              .toList(),
        );
      },
    );
  }

  @override
  Future<PeopleResponse> getCast({
    String? movieId,
  }) async {
    final response = await _apiService.get(
      '${UrlConstants.movieUrl}${movieId!}${UrlConstants.peopleUrl}',
      queryParameters: {
        QueryParametersConstants.extended: QueryParametersConstants.full,
      },
      isTrakt: true,
    );
    return PeopleResponse.fromJson(response.data);
  }
}
