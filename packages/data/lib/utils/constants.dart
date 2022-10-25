abstract class DioConstants {
  static const sendTimeout = 6000;
  static const receiveTimeout = 6000;
  static const connectTimeout = 6000;

  static const traktApiKey = 'trakt-api-key';
  static const applicationJson = 'application/json';
  static const traktDio = 'TRAKT';
  static const tmdbDio = 'TMDB';
  static const traktSetvice = 'traktService';
  static const tmdbSetvice = 'tmdbService';
  static const traktInterceptor = 'TRAKTInterceptor';
  static const tmdbInterceptor = 'TMDBInterceptor';
}

abstract class QueryParametersConstants {
  static const extended = 'extended';
  static const full = 'full';
  static const limit = 'limit';
  static const id = 'id';
  static const apiKey = 'api_key';
}

abstract class UrlConstants {
  static const baseUrl = 'https://api.trakt.tv/';
  static const tMDBUrl = 'https://api.themoviedb.org/3/';
  static const movieUrl = 'movies/';
  static const trendingUrl = 'trending/';
  static const anticipatedUrl = 'anticipated/';
  static const summaryUrl = 'id';
  static const peopleUrl = '/people';
  static const personUrl = '/person';
  static const imagesUrl = '/images';
  static const commentsUrl = '/comments';
  static const trendingFullUrl = '$movieUrl$trendingUrl';
  static const anticipatedFullUrl = '$movieUrl$anticipatedUrl';
  static const summaryFullUrl = '$movieUrl$summaryUrl';
  static const peopleFullUrl = '$movieUrl$peopleUrl';

  static const pagination = 'x-pagination-page-count';

  static String constantUrlCast({required String? movieId}) {
    return '$movieUrl$movieId$peopleUrl';
  }

  static String constantUrlImageOfPeople({required int? tMDBId}) {
    return '$personUrl/$tMDBId$imagesUrl';
  }

  static String constantURlComments({required String? movieId}) {
    return '$movieUrl$movieId$commentsUrl';
  }
}
