import 'package:domain/model/movie_anticipated.dart';
import 'package:domain/model/movie_trending.dart';
import 'package:presentation/screen/home/home_data.dart';
import 'package:presentation/screen/home/widgets/movie_model.dart';
import 'package:presentation/utils/image_path.dart';
import 'package:presentation/utils/extensions/extention_int.dart';

abstract class MapperMovie {
  HomeData mapGetListTrendingResponse(
    List<MovieTrendingResponse> listMovies,
    HomeData data,
  );

  HomeData mapGetListAnticipatedResponse(
    List<MovieAnticipatedResponse> listMovies,
    HomeData data,
  );

  factory MapperMovie() => _MapperImpl();
}

class _MapperImpl implements MapperMovie {
  @override
  HomeData mapGetListTrendingResponse(
    List<MovieTrendingResponse> listMovies,
    HomeData data,
  ) {
    final list = listMovies
        .map((e) => MovieModel(
              titles: e.movie.title ?? '',
              images: '${ImagesPath.imageUrl}${e.movie.image}',
              time: e.movie.runtime.getTimeString(),
              rating: (e.movie.rating ?? 0) / 2,
              genres: e.movie.genres ?? [],
              certifications: e.movie.certification ?? '',
            ))
        .toList();
    return data.copyWith(trendingMovies: list);
  }

  @override
  HomeData mapGetListAnticipatedResponse(
    List<MovieAnticipatedResponse> listMovies,
    HomeData data,
  ) {
    final list = listMovies
        .map((e) => MovieModel(
              titles: e.movie.title ?? '',
              images: '${ImagesPath.imageUrl}${e.movie.image}',
              time: e.movie.runtime.getTimeString(),
              rating: (e.movie.rating ?? 0) / 2,
              genres: e.movie.genres ?? [],
              certifications: e.movie.certification ?? '',
            ))
        .toList();
    return data.copyWith(anticipatedMovies: list);
  }
}
