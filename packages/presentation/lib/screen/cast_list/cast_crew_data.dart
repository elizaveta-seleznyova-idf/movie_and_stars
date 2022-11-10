import 'package:domain/model/people_and_images_model.dart';
import 'package:presentation/screen/cast_list/cast_crew_screen.dart';

class CastCrewData {
  CastCrewData({
    required this.castCrewScreenArguments,
    required this.detailsAboutPeople,
  });

  final CastCrewScreenArguments? castCrewScreenArguments;
  final List<PeopleAndImagesModel>? detailsAboutPeople;

  factory CastCrewData.init() => CastCrewData(
        castCrewScreenArguments: null,
        detailsAboutPeople: [],
      );

  CastCrewData copyWith({
    CastCrewScreenArguments? castCrewScreenArguments,
    List<PeopleAndImagesModel>? detailsAboutPeople,
  }) =>
      CastCrewData(
        castCrewScreenArguments:
            castCrewScreenArguments ?? this.castCrewScreenArguments,
        detailsAboutPeople: detailsAboutPeople ?? this.detailsAboutPeople,
      );
}
