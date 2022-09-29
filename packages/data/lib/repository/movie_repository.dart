import 'package:data/service/api_service.dart';
import 'package:data/service/service_payload.dart';
import 'package:data/utils/constants.dart';
import 'package:domain/di/data_model.dart';
import 'package:domain/repository/network_repository.dart';

class NetworkRepositoryImpl implements NetworkRepository {
  final ApiService<ServicePayload> _apiService;

  const NetworkRepositoryImpl(this._apiService);

  @override
  Future<GetDataResponse> getDataTrending({
    int? itemCount,
  }) async {
    return _apiService.get(
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
  Future<GetDataResponse> getDataAnticipated({
    int? itemCount,
  }) async {
    return _apiService.get(
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
}
