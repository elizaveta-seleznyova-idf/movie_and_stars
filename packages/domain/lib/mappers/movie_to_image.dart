import 'package:domain/mappers/base_mapper.dart';
import 'package:domain/utils/const.dart';

class MovieToImage extends Mapper<String, String> {
  MovieToImage({required this.apiKey});

  final String apiKey;

  @override
  String call(String params) =>
      '${UrlConstantsDomain.oMDBImageUrl}$apiKey&i=$params';
}
