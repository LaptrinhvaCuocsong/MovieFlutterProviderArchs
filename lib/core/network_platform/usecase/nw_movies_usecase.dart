import 'package:flutter_movie_provider_archs/core/core.dart';
import 'package:flutter_movie_provider_archs/core/domain/domain.dart';

class NwMoviesUsecase implements MoviesUsecase {
  @override
  Future<Result<Movies, Exception>> getPopularMovies(
      Map<String, dynamic> params) {
    throw UnimplementedError();
  }
}
