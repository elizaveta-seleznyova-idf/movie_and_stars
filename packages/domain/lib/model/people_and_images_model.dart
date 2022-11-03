class CastDBModelField {
  static const String movieId = 'movieId';
  static const String characters = 'characters';
  static const String person = 'person';
  static const String image = 'image';
}

class PeopleAndImagesModel {
  const PeopleAndImagesModel({
    required this.movieId,
    required this.characters,
    required this.person,
    required this.image,
  });

  final String? movieId;
  final String? characters;
  final String? person;
  final String? image;

  factory PeopleAndImagesModel.fromJson(Map<String, dynamic> json) =>
      PeopleAndImagesModel(
        movieId: json['id'],
        characters: json['characters'],
        person: json['person'],
        image: json['image'],
      );

  Map<String, dynamic> toJson(
    PeopleAndImagesModel model,
    String id,
  ) =>
      {
        CastDBModelField.movieId: id,
        CastDBModelField.characters: model.characters,
        CastDBModelField.person: model.person,
        CastDBModelField.image: model.image,
      };
}
