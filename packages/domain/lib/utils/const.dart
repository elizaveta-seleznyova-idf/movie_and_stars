abstract class UrlConstantsDomain {
  static const tMDBImageUrl = 'https://image.tmdb.org/t/p/original';

  static const oMDBImageUrl = 'http://img.omdbapi.com/?apikey=';

  static const pagination = 'x-pagination-page-count';

  static String getCastImagePath(String? filePath) {
    return '${UrlConstantsDomain.tMDBImageUrl}$filePath';
  }
}

abstract class ApiKeyNameConstant {
  static const omdbApiKey = 'omdbApiKeyName';
}
