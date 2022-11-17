class CastAndCrew {
  const CastAndCrew({
    this.character,
    this.characters,
    this.person,
  });

  final String? character;
  final List<String>? characters;
  final Person? person;

  factory CastAndCrew.fromJsonCast(Map<String, dynamic> json) {
    return CastAndCrew(
      character: json['character'],
      characters: json['characters'].cast<String>(),
      person: json['person'] == null
          ? null
          : Person.fromJson(
              json['person'] as Map<String, dynamic>,
            ),
    );
  }

  factory CastAndCrew.fromJsonCrew(Map<String, dynamic> json) {
    return CastAndCrew(
      character: json['job'],
      characters: json['jobs'].cast<String>(),
      person: json['person'] == null
          ? null
          : Person.fromJson(
        json['person'] as Map<String, dynamic>,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['character'] = character;
    data['characters'] = characters;
    if (person != null) {
      data['person'] = person!.toJson();
    }
    return data;
  }
}

class Person {
  const Person({
    this.name,
    this.ids,
    this.socialIds,
    this.biography,
    this.birthday,
    this.death,
    this.birthplace,
    this.homepage,
    this.knownForDepartment,
    this.gender,
  });

  final String? name;
  final CastIds? ids;
  final SocialIds? socialIds;
  final String? biography;
  final String? birthday;
  final String? death;
  final String? birthplace;
  final String? homepage;
  final String? knownForDepartment;
  final String? gender;

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      name: json['name'],
      ids: json['ids'] == null
          ? null
          : CastIds.fromJson(json['ids'] as Map<String, dynamic>),
      socialIds: json['socialIds'] == null
          ? null
          : SocialIds.fromJson(
              json['socialIds'] as Map<String, dynamic>,
            ),
      biography: json['biography'],
      birthday: json['birthday'],
      death: json['death'],
      birthplace: json['birthplace'],
      homepage: json['homepage'],
      knownForDepartment: json['known_for_department'],
      gender: json['gender'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    if (ids != null) {
      data['ids'] = ids!.toJson();
    }
    if (socialIds != null) {
      data['social_ids'] = socialIds!.toJson();
    }
    data['biography'] = biography;
    data['birthday'] = birthday;

    data['death'] = death;

    data['birthplace'] = birthplace;
    data['homepage'] = homepage;
    data['known_for_department'] = knownForDepartment;
    data['gender'] = gender;
    return data;
  }
}

class CastIds {
  const CastIds({
    this.trakt,
    this.slug,
    this.imdb,
    this.tmdb,
    this.tvrage,
  });

  final int? trakt;
  final String? slug;
  final String? imdb;
  final int? tmdb;
  final int? tvrage;

  factory CastIds.fromJson(Map<String, dynamic> json) {
    return CastIds(
      trakt: json['trakt'],
      slug: json['slug'],
      imdb: json['imdb'],
      tmdb: json['tmdb'],
      tvrage: json['tvrage'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['trakt'] = trakt;
    data['slug'] = slug;
    data['imdb'] = imdb;
    data['tmdb'] = tmdb;
    data['tvrage'] = tvrage;
    return data;
  }
}

class SocialIds {
  const SocialIds({
    this.twitter,
    this.facebook,
    this.instagram,
  });

  final String? twitter;
  final String? facebook;
  final String? instagram;

  factory SocialIds.fromJson(Map<String, dynamic> json) {
    return SocialIds(
      twitter: json['twitter'],
      facebook: json['facebook'],
      instagram: json['instagram'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['twitter'] = twitter;
    data['facebook'] = facebook;
    data['instagram'] = instagram;
    return data;
  }
}
