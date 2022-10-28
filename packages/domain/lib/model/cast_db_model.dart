import 'package:domain/model/people_and_images_model.dart';

class CastDBModelField {
  static const String movieId = 'movieId';
  static const String characters = 'characters';
  static const String person = 'person';
  static const String image = 'image';
}

class CastDBModel {
  const CastDBModel({
    required this.movieId,
    required this.characters,
    required this.person,
    required this.image,
  });

  final String? movieId;
  final String? characters;
  final String? person;
  final String? image;

  static CastDBModel fromResponse(
    PeopleAndImagesModel peopleAndImagesModel,
    String id,
  ) {
    return CastDBModel(
      movieId: id,
      characters: peopleAndImagesModel.characters,
      person: peopleAndImagesModel.person,
      image: peopleAndImagesModel.image,
    );
  }

  factory CastDBModel.fromJson(Map<String, dynamic> json) => CastDBModel(
        movieId: json['id'],
        characters: json['characters'],
        person: json['person'],
        image: json['image'],
      );

  Map<String, dynamic> toJson(
    CastDBModel model,
    String id,
  ) =>
      {
        CastDBModelField.movieId: id,
        CastDBModelField.characters: model.characters,
        CastDBModelField.person: model.person,
        CastDBModelField.image: model.image,
      };
}
