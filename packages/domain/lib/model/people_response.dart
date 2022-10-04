import 'package:domain/model/cast.dart';

class PeopleResponse {
  const PeopleResponse(this.cast);

  final List<Cast>? cast;

  factory PeopleResponse.fromJson(Map<String, dynamic> json) {
    return PeopleResponse(
      (json['cast'] as List<dynamic>?)
          ?.map((e) => Cast.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson(PeopleResponse instance) => <String, dynamic>{
        'cast': instance.cast?.map((e) => e.toJson()).toList(),
      };
}
