import 'package:domain/di/data_model.dart';

abstract class NetworkRepository {
  Future<GetDataResponse> getHttp(String path);
}
