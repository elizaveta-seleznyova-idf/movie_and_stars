import 'package:domain/model/movie.dart';
import 'package:presentation/screen/movie_details/details_data.dart';
import 'package:presentation/screen/movie_details/model/delails_model.dart';
import 'package:presentation/utils/extensions/extention_double.dart';
import 'package:presentation/utils/extensions/extention_int.dart';
import 'package:presentation/utils/extensions/extention_list.dart';
import 'package:presentation/utils/image_path.dart';

abstract class MapperDetails {
  DetailsModel detailsAboutMovies(
    Movie detailsAboutMovies,
    DetailsData data,
  );

  factory MapperDetails() => _MapperImpl();
}

class _MapperImpl implements MapperDetails {
  @override
  DetailsModel detailsAboutMovies(
    Movie detailsAboutMovies,
    DetailsData data,
  ) {
    final list = DetailsModel(
      title: detailsAboutMovies.title ?? '',
      overview: detailsAboutMovies.overview ?? '',
      image: '${ImagesPath.imageUrl}${detailsAboutMovies.ids?.imdb}',
      runTime: detailsAboutMovies.runtime?.getTimeString() ?? '',
      rating: detailsAboutMovies.rating?.getTimeDouble() ?? 0.0,
      genres: detailsAboutMovies.genres?.capitalizeFirstOfEach() ?? '',
      certification: detailsAboutMovies.certification ?? '',
    );
    return list;
  }
}
