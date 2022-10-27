import 'package:domain/model/movie.dart';
import 'package:domain/model/people_and_images_model.dart';
import 'package:presentation/enum/details_tab_state.dart';
import 'package:presentation/screen/movie_details/details_screen.dart';
import 'package:presentation/screen/movie_details/model/comments_model.dart';
import 'package:presentation/screen/movie_details/model/delails_model.dart';

class DetailsData {
  const DetailsData({
    required this.detailsAboutMovie,
    required this.aboutMovie,
    required this.movieComments,
    required this.detailsAboutPeople,
    required this.detailsScreenArguments,
    required this.tabState,
  });

  final Movie? detailsAboutMovie;
  final DetailsModel? aboutMovie;
  final List<CommentsModel> movieComments;
  final List<PeopleAndImagesModel>? detailsAboutPeople;
  final DetailsScreenArguments? detailsScreenArguments;
  final DetailsTabState tabState;

  factory DetailsData.init() => const DetailsData(
        detailsAboutMovie: null,
        aboutMovie: null,
        detailsAboutPeople: [],
        movieComments: [],
        detailsScreenArguments: null,
        tabState: DetailsTabState.details,
      );

  DetailsData copyWith({
    Movie? detailsAboutMovie,
    DetailsModel? aboutMovie,
    List<CommentsModel>? movieComments,
    List<PeopleAndImagesModel>? detailsAboutPeople,
    DetailsScreenArguments? detailsScreenArguments,
    DetailsTabState? tabState,
  }) =>
      DetailsData(
        detailsAboutMovie: detailsAboutMovie ?? this.detailsAboutMovie,
        aboutMovie: aboutMovie ?? this.aboutMovie,
        movieComments: movieComments ?? this.movieComments,
        detailsAboutPeople: detailsAboutPeople ?? this.detailsAboutPeople,
        detailsScreenArguments: detailsScreenArguments ?? this.detailsScreenArguments,
        tabState: tabState ?? this.tabState,
      );
}
