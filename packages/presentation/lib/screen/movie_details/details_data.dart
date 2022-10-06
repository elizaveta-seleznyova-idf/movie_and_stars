import 'package:domain/model/movie.dart';
import 'package:domain/model/people_and_images_model.dart';
import 'package:presentation/screen/movie_details/model/delails_model.dart';

class DetailsData {
  const DetailsData({
    required this.detailsAboutMovie,
    required this.aboutMovie,
    required this.detailsAboutPeople,
  });

  final Movie? detailsAboutMovie;
  final DetailsModel? aboutMovie;
  final List<PeopleAndImagesModel>? detailsAboutPeople;

  factory DetailsData.init() => const DetailsData(
        detailsAboutMovie: null,
        aboutMovie: null,
        detailsAboutPeople: [],
      );

  DetailsData copyWith({
    Movie? detailsAboutMovie,
    DetailsModel? aboutMovie,
    List<PeopleAndImagesModel>? detailsAboutPeople,
  }) =>
      DetailsData(
        detailsAboutMovie: detailsAboutMovie ?? this.detailsAboutMovie,
        aboutMovie: aboutMovie ?? this.aboutMovie,
        detailsAboutPeople: detailsAboutPeople ?? this.detailsAboutPeople,
      );
}
