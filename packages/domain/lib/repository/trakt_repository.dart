import 'package:domain/model/comments.dart';
import 'package:domain/model/data_model.dart';
import 'package:domain/model/people_response.dart';

abstract class TraktRepository {
  Future<GetDataResponse> getDataTrending({int? itemCount});

  Future<GetDataResponse> getDataAnticipated({int? itemCount});

  Future<PeopleResponse> getCast({required String movieId});

  Future<List<Comments>> getComments({required String movieId});
}
