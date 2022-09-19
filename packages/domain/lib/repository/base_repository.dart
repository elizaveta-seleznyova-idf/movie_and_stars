import 'package:domain/di/data_model.dart';

abstract class NetworkRepository {
  Future<GetDataResponse> getDataTrending({int? itemCount});

  Future<GetDataResponse> getDataAnticipated({int? itemCount});
}
