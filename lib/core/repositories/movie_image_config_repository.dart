import 'package:flutter_movie_provider_archs/core/core.dart';

abstract class MovieImageConfigRepository {
  Future<Result<MovieImageConfig, Exception>> getMovieImageConfig();
}
