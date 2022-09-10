import 'package:flutter_movie_provider_archs/core/core.dart';

abstract class MoviesRepository {
  Future<Result<Movies, Exception>> getPopularMovies(Map<String, dynamic> params);
}