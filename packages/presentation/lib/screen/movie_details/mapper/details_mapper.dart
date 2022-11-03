import 'package:domain/mappers/movie_to_image.dart';
import 'package:domain/model/comments.dart';
import 'package:intl/intl.dart';
import 'package:domain/model/movie_db_model.dart';
import 'package:presentation/screen/movie_details/details_data.dart';
import 'package:presentation/screen/movie_details/model/comments_model.dart';
import 'package:presentation/screen/movie_details/model/delails_model.dart';
import 'package:presentation/utils/extensions/extention_int.dart';
import 'package:presentation/utils/extensions/extention_list.dart';

abstract class MapperDetails {
  DetailsModel detailsAboutMovies(
    MovieDBModel detailsAboutMovies,
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
    MovieDBModel detailsAboutMovies,
    DetailsData data,
  ) {
    final list = DetailsModel(
      title: detailsAboutMovies.title ?? '',
      overview: detailsAboutMovies.overview ?? '',
      image: movieToImage(detailsAboutMovies.movieIdImdb ?? ''),
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
              dateComment: _parseCommentDate(e.dateComment ?? ''),
              rating: double.parse(((e.rating ?? 0) / 2).toStringAsFixed(1)),
              userName: e.user?.userName ?? '',
              userImage: e.user?.userImage?.avatar?.full ?? '',
            ))
        .toList();
    return data.copyWith(movieComments: list);
  }
}

String _parseCommentDate(String date) {
  DateTime parseDate = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(date);
  var inputDate = DateTime.parse(parseDate.toString());
  var outputFormat = DateFormat('MMMM dd, yyyy');
  var outputDate = outputFormat.format(inputDate);
  return outputDate;
}
