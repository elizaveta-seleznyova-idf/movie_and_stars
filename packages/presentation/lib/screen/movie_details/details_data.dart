import 'package:domain/model/movie.dart';
import 'package:domain/model/people_and_images_model.dart';

class DetailsData {
  const DetailsData({
    required this.detailsAboutMovie,
    required this.detailsAboutPeople,
  });

  final Movie? detailsAboutMovie;
  final List<PeopleAndImagesModel>? detailsAboutPeople;

  factory DetailsData.init() => const DetailsData(
        detailsAboutMovie: null,
        detailsAboutPeople: [],
      );

  DetailsData copyWith({
    Movie? detailsAboutMovie,
  }) =>
      DetailsData(
        detailsAboutMovie: detailsAboutMovie ?? this.detailsAboutMovie,
        detailsAboutPeople: detailsAboutPeople ?? this.detailsAboutPeople,
      );
}
