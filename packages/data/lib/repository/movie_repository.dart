import 'package:data/service/api_base_service.dart';
import 'package:data/service/service_payload.dart';
import 'package:data/utils/api_key_data.dart';
import 'package:domain/di/data_model.dart';
import 'package:domain/repository/base_repository.dart';

class NetworkRepositoryImpl implements NetworkRepository {
  final ApiBaseService<ServicePayload> _apiService;

  NetworkRepositoryImpl(this._apiService);

  @override
  Future<GetDataResponse> getData(
      {required String apiPath, int? itemCount}) async {
    return _apiService.get(
      apiPath,
      queryParameters: {
        'extended': 'full',
        'limit': itemCount,
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
