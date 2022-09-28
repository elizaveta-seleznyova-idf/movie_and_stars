import 'package:domain/model/data_model.dart';
import 'package:domain/model/people_response.dart';

abstract class TRAKTRepository {
  Future<GetDataResponse> getDataTrending({int? itemCount});

  Future<GetDataResponse> getDataAnticipated({int? itemCount});

  Future<PeopleResponse> getCast({String? movieId});
}
