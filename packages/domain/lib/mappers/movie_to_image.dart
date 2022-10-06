import 'package:domain/mappers/base_mapper.dart';
import 'package:domain/utils/const.dart';

class MovieToImage extends Mapper<String, String> {
  final String apiKey;

  MovieToImage({required this.apiKey});

  @override
  String call(String params) =>
      '${UrlConstantsDomain.oMDBImageUrl}$apiKey=$params';
}
