abstract class C {
  static const baseUrl = 'https://api.trakt.tv/';
  static const movieUrl = 'movies/';
  static const trendingUrl = 'trending/';
  static const anticipatedUrl = 'anticipated/';
  static const trendingFullUrl = C.movieUrl + C.trendingUrl;
  static const anticipatedFullUrl = C.movieUrl + C.anticipatedUrl;
  static const tMDBImageUrl = 'https://image.tmdb.org/t/p/original';

  static const pagination = 'x-pagination-page-count';
}
