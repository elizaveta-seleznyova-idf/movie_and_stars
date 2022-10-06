import 'package:data/service/service_payload.dart';
import 'package:data/utils/constants.dart';
import 'package:domain/model/data_model.dart';
import 'package:domain/model/people_response.dart';
import 'package:domain/repository/trakt_repository.dart';

import '../service/api_service.dart';

class TraktRepositoryImpl implements TraktRepository {
  final ApiService<DioServicePayload> apiService;

  const TraktRepositoryImpl(this.apiService);

  @override
  Future<GetDataResponse> getDataTrending({int? itemCount}) async {
    return apiService.get(
      UrlConstants.trendingFullUrl,
      queryParameters: {
        QueryParametersConstants.extended: QueryParametersConstants.full,
        QueryParametersConstants.limit: itemCount,
      },
    ).then(
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
    return apiService.get(
      UrlConstants.anticipatedFullUrl,
      queryParameters: {
        QueryParametersConstants.extended: QueryParametersConstants.full,
        QueryParametersConstants.limit: itemCount,
      },
    ).then(
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
    final castUrl = UrlConstants.constantUrlCast(movieId: movieId);
    final response = await apiService.get(
      castUrl,
      queryParameters: {
        QueryParametersConstants.extended: QueryParametersConstants.full,
      },
    );
    return PeopleResponse.fromJson(response.data);
  }
}
