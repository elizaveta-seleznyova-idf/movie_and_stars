import 'package:domain/model/cast_and_crew.dart';

class PeopleResponse {
  const PeopleResponse({this.cast});

  final List<Cast>? cast;

  factory PeopleResponse.fromJson(Map<String, dynamic> json) {
    // final crew = (json['crew'] as Map<String, dynamic>?);
    // final List<Cast>? crewList = [];
    // crew?.forEach((key, value) {
    //   final valueList = (value as List<dynamic>)
    //       .map((eValue) => Cast.fromJsonCrew(eValue as Map<String, dynamic>)).toList();
    //   crewList?.addAll(valueList);
    // });

    final cast = (json['cast'] as List<dynamic>?)
        ?.map((e) => Cast.fromJson(e as Map<String, dynamic>))
        .toList();
    //cast?.addAll(crewList ?? []);
    return PeopleResponse(cast: cast);
  }

  Map<String, dynamic> toJson(PeopleResponse instance) => <String, dynamic>{
        'cast': instance.cast?.map((e) => e.toJson()).toList(),
      };
}
