import 'package:domain/mappers/movie_to_image.dart';
import 'package:domain/model/movie_db_model.dart';
import 'package:presentation/screen/movie_details/details_data.dart';
import 'package:presentation/screen/movie_details/model/delails_model.dart';
import 'package:presentation/utils/extensions/extention_int.dart';
import 'package:presentation/utils/extensions/extention_list.dart';

abstract class MapperDetails {
  DetailsModel detailsAboutMovies(
    MovieDBModel detailsAboutMovies,
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
}
