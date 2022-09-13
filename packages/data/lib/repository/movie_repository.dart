import 'package:data/service/api_base_service.dart';
import 'package:data/service/service_payload.dart';
import 'package:data/utils/api_key_data.dart';
import 'package:domain/di/data_model.dart';
import 'package:domain/repository/base_repository.dart';

class NetworkRepositoryImpl implements NetworkRepository {
  final ApiBaseService<ServicePayload> _apiService;

  NetworkRepositoryImpl(this._apiService);

  @override
  Future<GetDataResponse> getHttp(String path) async {
    return _apiService
        .get(
      path,
      //options: Options(headers: headers1),
      queryParameters: queryParam1,
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

  Map<String, dynamic> get headers1 => {
        'Content-Type': 'application/json',
        'trakt-api-version': '2',
        'trakt-api-key':
            ApiKeyData.apiKeyData,
      };

  Map<String, dynamic> get queryParam1 => {
        'extended': 'full',
        // 'limit': '10',
      };
}
