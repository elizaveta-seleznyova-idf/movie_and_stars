import 'package:domain/mappers/movie_to_image.dart';
import 'package:domain/model/movie_db_model.dart';
import 'package:presentation/config/dimens/dimens.dart';
import 'package:presentation/screen/home/home_data.dart';
import 'package:presentation/screen/home/model/movie_model.dart';
import 'package:presentation/utils/extensions/extention_int.dart';
import 'package:presentation/utils/extensions/extention_string.dart';

abstract class MapperMovie {
  HomeData mapGetListTrendingResponse(
    List<MovieDBModel> listMovies,
    HomeData data,
  );

  HomeData mapGetListAnticipatedResponse(
    List<MovieDBModel> listMovies,
    HomeData data,
  );

  factory MapperMovie(MovieToImage movieToImage) => _MapperImpl(movieToImage);
}

class _MapperImpl implements MapperMovie {
  _MapperImpl(this.movieToImage);

  final MovieToImage movieToImage;

  @override
  HomeData mapGetListTrendingResponse(
    List<MovieDBModel> listMovies,
    HomeData data,
  ) {
    final list = listMovies
        .map((e) => MovieModel(
              titles: e.title ?? '',
              images: movieToImage(e.movieIdImdb ?? ''),
              movieId: e.movieIdSlug ?? '',
              time: e.runtime.getTimeString(),
              rating: (e.rating ?? 0) / Dimens.size2,
              genres: e.genres?.first.capitalize() ?? '',
              certifications: e.certification ?? '',
            ))
        .toList();
    return data.copyWith(trendingMovies: list);
  }

  @override
  HomeData mapGetListAnticipatedResponse(
    List<MovieDBModel> listMovies,
    HomeData data,
  ) {
    final list = listMovies
        .map((e) => MovieModel(
              titles: e.title ?? '',
              images: movieToImage(e.movieIdImdb ?? ''),
              movieId: e.movieIdSlug ?? '',
              time: e.runtime.getTimeString(),
              rating: (e.rating ?? 0) / Dimens.size2,
              genres: e.genres?.first.capitalize() ?? '',
              certifications: e.certification ?? '',
            ))
        .toList();
    return data.copyWith(anticipatedMovies: list);
  }
}
