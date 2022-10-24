import 'package:domain/model/comments.dart';
import 'package:domain/repository/trakt_repository.dart';
import 'package:domain/use_case/use_case.dart';

class GetCommentsUseCase
    implements UseCaseParams<String?, Future<List<Comments>>> {
  const GetCommentsUseCase(this._traktRepository);

  final TraktRepository _traktRepository;

  @override
  Future<List<Comments>> call(String? params) {
    return _traktRepository.getComments(movieId: params);
  }
}
