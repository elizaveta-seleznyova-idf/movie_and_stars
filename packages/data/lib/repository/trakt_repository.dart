import 'package:data/service/api_base_service.dart';
import 'package:data/service/service_payload.dart';
import 'package:data/utils/constants.dart';
import 'package:domain/model/data_model.dart';
import 'package:domain/model/people_response.dart';
import 'package:domain/repository/general_repository.dart';

class TRAKTRepositoryImpl implements TRAKTRepository {
  final ApiBaseService<ServicePayload> _apiService;

  TRAKTRepositoryImpl(this._apiService);

  @override
  Future<GetDataResponse> getDataTrending({int? itemCount}) async {
    return _apiService
        .get(
      C.trendingFullUrl,
      queryParameters: {
        Q.extended: Q.full,
        Q.limit: itemCount,
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
      C.anticipatedFullUrl,
      queryParameters: {
        Q.extended: Q.full,
        Q.limit: itemCount,
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
      '${C.movieUrl}${movieId!}${C.peopleUrl}',
      queryParameters: {
        Q.extended: Q.full,
      },
      isTrakt: true,
    );
    return PeopleResponse.fromJson(response.data);
  }
}
