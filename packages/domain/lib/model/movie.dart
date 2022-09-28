class Movie {
  final String? title;
  final int? year;
  final Ids? ids;
  final String? tagline;
  final String? overview;
  final String? released;
  final int? runtime;
  final String? country;
  final String? trailer;
  final String? homepage;
  final String? status;
  final double? rating;
  final int? votes;
  final int? commentCount;
  final String? updatedAt;
  final String? language;
  final List<String>? availableTranslations;
  final List<String>? genres;
  final String? certification;

  Movie({
    this.title,
    this.year,
    this.ids,
    this.tagline,
    this.overview,
    this.released,
    this.runtime,
    this.country,
    this.trailer,
    this.homepage,
    this.status,
    this.rating,
    this.votes,
    this.commentCount,
    this.updatedAt,
    this.language,
    this.availableTranslations,
    this.genres,
    this.certification,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['title'],
      year: json['year'],
      ids: json['ids'] == null
          ? null
          : Ids.fromJson(json['ids'] as Map<String, dynamic>),
      tagline: json['tagline'],
      overview: json['overview'],
      released: json['released'],
      runtime: json['runtime'],
      country: json['country'],
      trailer: json['trailer'],
      homepage: json['homepage'],
      status: json['status'],
      rating: json['rating'],
      votes: json['votes'],
      commentCount: json['comment_count'],
      updatedAt: json['updated_at'],
      language: json['language'],
      availableTranslations: json['available_translations'].cast<String>(),
      genres: json['genres'].cast<String>(),
      certification: json['certification'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['year'] = year;
    if (ids != null) {
      data['ids'] = ids!.toJson();
    }
    data['tagline'] = tagline;
    data['overview'] = overview;
    data['released'] = released;
    data['runtime'] = runtime;
    data['country'] = country;
    data['trailer'] = trailer;
    data['homepage'] = homepage;
    data['status'] = status;
    data['rating'] = rating;
    data['votes'] = votes;
    data['comment_count'] = commentCount;
    data['updated_at'] = updatedAt;
    data['language'] = language;
    data['available_translations'] = availableTranslations;
    data['genres'] = genres;
    data['certification'] = certification;
    return data;
  }
}

class Ids {
  final num? trakt;
  final String? slug;
  final String? imdb;
  final num? tmdb;

  Ids({
    this.trakt,
    this.slug,
    this.imdb,
    this.tmdb,
  });

  factory Ids.fromJson(Map<String, dynamic> json) {
    return Ids(
      trakt: json['trakt'],
      slug: json['slug'],
      imdb: json['imdb'],
      tmdb: json['tmdb'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['trakt'] = trakt;
    data['slug'] = slug;
    data['imdb'] = imdb;
    data['tmdb'] = tmdb;
    return data;
  }
}
