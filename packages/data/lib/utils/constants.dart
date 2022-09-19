abstract class D {
  static const sendTimeout = 6000;
  static const receiveTimeout = 6000;
  static const connectTimeout = 6000;

  static const traktApiKey = 'trakt-api-key';
  static const applicationJson = 'application/json';
}

abstract class Q {
  static const extended = 'extended';
  static const full = 'full';
  static const limit = 'limit';
}

abstract class C {
  static const baseUrl = 'https://api.trakt.tv/';
  static const movieUrl = 'movies/';
  static const trendingUrl = 'trending/';
  static const anticipatedUrl = 'anticipated/';
  static const trendingFullUrl = C.movieUrl + C.trendingUrl;
  static const anticipatedFullUrl = C.movieUrl + C.anticipatedUrl;

  static const pagination = 'x-pagination-page-count';
}
