class MovieAnticipatedResponse {
  int? listCount;
  MovieAnticipated? movie;

  MovieAnticipatedResponse({this.listCount, this.movie});

  MovieAnticipatedResponse.fromJson(Map<String, dynamic> json) {
    listCount = json['list_count'];
    movie =
        json['movie'] != null ? MovieAnticipated.fromJson(json['movie']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['list_count'] = listCount;
    if (movie != null) {
      data['movie'] = movie!.toJson();
    }
    return data;
  }
}

class MovieAnticipated {
  final String? title;
  final int? year;
  final String? image;
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

  MovieAnticipated({
    this.title,
    this.year,
    this.image,
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

  factory MovieAnticipated.fromJson(Map<String, dynamic> json) {
    return MovieAnticipated(
      title: json['title'],
      year: json['year'],
      image: json['ids']['imdb'],
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
    data['image']['imdb'] = image;
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
