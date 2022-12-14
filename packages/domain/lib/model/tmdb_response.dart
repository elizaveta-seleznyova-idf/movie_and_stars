class TmdbResponse {
  const TmdbResponse({
    required this.id,
    required this.profiles,
  });

  final int? id;
  final List<Profiles>? profiles;

  factory TmdbResponse.fromJson(Map<String, dynamic> json) {
    final profiles = json['profiles'] as List<dynamic>?;
    return TmdbResponse(
      id: json['id'],
      profiles: profiles?.map((e) => Profiles.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (profiles != null) {
      data['profiles'] = profiles?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Profiles {
  const Profiles({
    required this.aspectRatio,
    required this.height,
    required this.iso6391,
    required this.filePath,
    required this.voteAverage,
    required this.voteCount,
    required this.width,
  });

  final double aspectRatio;
  final int height;
  final dynamic iso6391;
  final String filePath;
  final double voteAverage;
  final int voteCount;
  final int width;

  factory Profiles.fromJson(Map<String, dynamic> json) {
    return Profiles(
      aspectRatio: json['aspect_ratio'],
      height: json['height'],
      iso6391: json['iso_639_1'],
      filePath: json['file_path'],
      voteAverage: json['vote_average'],
      voteCount: json['vote_count'],
      width: json['width'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['aspect_ratio'] = aspectRatio;
    data['height'] = height;
    data['iso_639_1'] = iso6391;
    data['file_path'] = filePath;
    data['vote_average'] = voteAverage;
    data['vote_count'] = voteCount;
    data['width'] = width;
    return data;
  }
}
