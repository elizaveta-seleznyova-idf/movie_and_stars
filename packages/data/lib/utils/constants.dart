abstract class D {
  static const sendTimeout = 6000;
  static const receiveTimeout = 6000;
  static const connectTimeout = 6000;

  static const traktApiKey = 'trakt-api-key';
  static const applicationJson = 'application/json';
  static const traktDio = 'TRAKT';
  static const tmdbDio = 'TMDB';
  static const traktInterceptor = 'TRAKTInterceptor';
  static const tmdbInterceptor = 'TMDBInterceptor';
}

abstract class Q {
  static const extended = 'extended';
  static const full = 'full';
  static const limit = 'limit';
  static const id = 'id';
  static const apiKey = 'api_key';
}

abstract class C {
  static const baseUrl = 'https://api.trakt.tv/';
  static const tMDBUrl = 'https://api.themoviedb.org/3/';
  static const movieUrl = 'movies/';
  static const trendingUrl = 'trending/';
  static const anticipatedUrl = 'anticipated/';
  static const summaryUrl = 'id';
  static const peopleUrl = '/people';
  static const personUrl = '/person';
  static const imagesUrl = '/images';
  static const trendingFullUrl = C.movieUrl + C.trendingUrl;
  static const anticipatedFullUrl = C.movieUrl + C.anticipatedUrl;
  static const summaryFullUrl = C.movieUrl + C.summaryUrl;
  static const peopleFullUrl = C.movieUrl + C.peopleUrl;

  static const pagination = 'x-pagination-page-count';
}
