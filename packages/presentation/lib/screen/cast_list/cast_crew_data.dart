import 'package:domain/model/people_and_images_model.dart';

class CastCrewData {
  CastCrewData({
    required this.detailsAboutPeople,
  });

  final List<PeopleAndImagesModel>? detailsAboutPeople;

  factory CastCrewData.init() => CastCrewData(
        detailsAboutPeople: [],
      );

  CastCrewData copyWith({
    List<PeopleAndImagesModel>? detailsAboutPeople,
  }) =>
      CastCrewData(
        detailsAboutPeople: detailsAboutPeople ?? this.detailsAboutPeople,
      );
}
