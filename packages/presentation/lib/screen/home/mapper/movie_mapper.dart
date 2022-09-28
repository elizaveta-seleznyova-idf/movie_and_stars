import 'package:domain/model/movie_response.dart';
import 'package:presentation/screen/home/home_data.dart';
import 'package:presentation/screen/home/model/movie_model.dart';
import 'package:presentation/utils/extensions/extention_int.dart';
import 'package:presentation/utils/extensions/extention_string.dart';
import 'package:presentation/utils/image_path.dart';

abstract class MapperMovie {
  HomeData mapGetListTrendingResponse(
    List<MovieResponse> listMovies,
    HomeData data,
  );

  HomeData mapGetListAnticipatedResponse(
    List<MovieResponse> listMovies,
    HomeData data,
  );

  factory MapperMovie() => _MapperImpl();
}

class _MapperImpl implements MapperMovie {
  @override
  HomeData mapGetListTrendingResponse(
    List<MovieResponse> listMovies,
    HomeData data,
  ) {
    final list = listMovies
        .map((e) => MovieModel(
              titles: e.movie.title ?? '',
              images: '${ImagesPath.imageUrl}${e.movie.ids?.imdb!}',
              movieId: e.movie.ids?.slug ?? '',
              time: e.movie.runtime.getTimeString(),
              rating: (e.movie.rating ?? 0) / 2,
              genres: e.movie.genres?.first.capitalize() ?? '',
              certifications: e.movie.certification ?? '',
            ))
        .toList();
    return data.copyWith(trendingMovies: list);
  }

  @override
  HomeData mapGetListAnticipatedResponse(
    List<MovieResponse> listMovies,
    HomeData data,
  ) {
    final list = listMovies
        .map((e) => MovieModel(
              titles: e.movie.title ?? '',
              images: '${ImagesPath.imageUrl}${e.movie.ids?.imdb}',
              movieId: e.movie.ids?.slug ?? '',
              time: e.movie.runtime.getTimeString(),
              rating: (e.movie.rating ?? 0) / 2,
              genres: e.movie.genres?.first.capitalize() ?? '',
              certifications: e.movie.certification ?? '',
            ))
        .toList();
    return data.copyWith(anticipatedMovies: list);
  }
}
