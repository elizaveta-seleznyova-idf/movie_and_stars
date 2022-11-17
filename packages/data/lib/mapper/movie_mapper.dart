import 'package:domain/mappers/base_mapper.dart';
import 'package:domain/model/movie_db_model.dart';

class MovieMapper extends Mapper<List<Map<String, dynamic>>, List<MovieDBModel>>{
  @override
  List<MovieDBModel> call(List<Map<String, dynamic>> params) {
    return List.generate(params.length, (i) {
      return MovieDBModel(
        title: params[i]['title'],
        movieIdSlug: params[i]['movieIdSlug'],
        movieIdImdb: params[i]['movieIdImdb'],
        movieIdTmdb: params[i]['movieIdTmdb'],
        overview: params[i]['overview'],
        runtime: params[i]['runtime'],
        rating: params[i]['rating'],
        genres: params[i]['genres'].split(','),
        certification: params[i]['certification'],
      );
    });
  }



}