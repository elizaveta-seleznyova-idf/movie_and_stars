import 'package:domain/mappers/movie_to_image.dart';
import 'package:domain/model/comments.dart';
import 'package:domain/model/movie.dart';
import 'package:presentation/screen/movie_details/details_data.dart';
import 'package:presentation/screen/movie_details/model/comments_model.dart';
import 'package:presentation/screen/movie_details/model/delails_model.dart';
import 'package:presentation/utils/extensions/extention_int.dart';
import 'package:presentation/utils/extensions/extention_list.dart';
import 'package:presentation/utils/extensions/extention_string.dart';

abstract class MapperDetails {
  DetailsModel detailsAboutMovies(
    Movie detailsAboutMovies,
    DetailsData data,
  );

  DetailsData commentsAboutMovie(
    List<Comments> commentsAboutMovie,
    DetailsData data,
  );

  factory MapperDetails(MovieToImage movieToImage) => _MapperImpl(movieToImage);
}

class _MapperImpl implements MapperDetails {
  _MapperImpl(this.movieToImage);

  final MovieToImage movieToImage;

  @override
  DetailsModel detailsAboutMovies(
    Movie detailsAboutMovies,
    DetailsData data,
  ) {
    final list = DetailsModel(
      title: detailsAboutMovies.title ?? '',
      overview: detailsAboutMovies.overview ?? '',
      image: movieToImage(detailsAboutMovies.ids?.imdb ?? ''),
      runTime: detailsAboutMovies.runtime?.getTimeString() ?? '',
      rating: double.parse(
          ((detailsAboutMovies.rating ?? 0) / 2).toStringAsFixed(1)),
      genres: detailsAboutMovies.genres?.capitalizeFirstOfEach() ?? '',
      certification: detailsAboutMovies.certification ?? '',
    );
    return list;
  }

  @override
  DetailsData commentsAboutMovie(
    List<Comments> commentsAboutMovie,
    DetailsData data,
  ) {
    final list = commentsAboutMovie
        .map((e) => CommentsModel(
              comment: e.comment ?? '',
              dateComment: e.dateComment?.convertData() ?? '',
              rating: double.parse(((e.rating ?? 0) / 2).toStringAsFixed(1)),
              userName: e.user?.userName ?? '',
              userImage: e.user?.userImage?.avatar?.full ?? '',
            ))
        .toList();
    return data.copyWith(movieComments: list);
  }
}
