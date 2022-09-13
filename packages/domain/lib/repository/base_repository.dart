import 'package:domain/di/data_model.dart';

abstract class NetworkRepository {
  Future<GetDataResponse> getData({required String apiPath, int? itemCount});
}
