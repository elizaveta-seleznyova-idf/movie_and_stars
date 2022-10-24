import 'package:data/service/api_service.dart';
import 'package:data/service/service_payload.dart';
import 'package:data/utils/constants.dart';
import 'package:domain/model/comments.dart';
import 'package:domain/model/data_model.dart';
import 'package:domain/model/people_response.dart';
import 'package:domain/repository/trakt_repository.dart';

class TraktRepositoryImpl implements TraktRepository {
  const TraktRepositoryImpl(this.apiService);

  final ApiService<DioServicePayload> apiService;

  @override
  Future<GetDataResponse> getDataTrending({int? itemCount}) async {
    final response = await apiService.get(
      UrlConstants.trendingFullUrl,
      queryParameters: {
        QueryParametersConstants.extended: QueryParametersConstants.full,
        QueryParametersConstants.limit: itemCount,
      },
    );
    return GetDataResponse(
      headers: response.headers.map,
      body: (response.data as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
    );
  }

  @override
  Future<GetDataResponse> getDataAnticipated({int? itemCount}) async {
    final response = await apiService.get(
      UrlConstants.anticipatedFullUrl,
      queryParameters: {
        QueryParametersConstants.extended: QueryParametersConstants.full,
        QueryParametersConstants.limit: itemCount,
      },
    );
    return GetDataResponse(
      headers: response.headers.map,
      body: (response.data as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
    );
  }

  @override
  Future<PeopleResponse> getCast({String? movieId}) async {
    final castUrl = UrlConstants.constantUrlCast(movieId: movieId);
    final response = await apiService.get(
      castUrl,
      queryParameters: {
        QueryParametersConstants.extended: QueryParametersConstants.full,
      },
    );
    return PeopleResponse.fromJson(response.data);
  }

  @override
  Future<List<Comments>> getComments({String? movieId}) async {
    final commentUrl = UrlConstants.constantURlComments(movieId: movieId);
    final response = await apiService.get(commentUrl, queryParameters: {
      QueryParametersConstants.extended: QueryParametersConstants.full,
    });
    final data = response.data as List<dynamic>;
    return data.map((e) => Comments.fromJson(e)).toList();
  }
}
