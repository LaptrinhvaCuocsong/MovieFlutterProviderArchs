import 'package:flutter_movie_provider_archs/core/core.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  MoviesUsecase nwMoviesUsecase;

  MoviesRepositoryImpl({required this.nwMoviesUsecase});

  @override
  Future<Result<Movies, Exception>> getPopularMovies(Map<String, dynamic> params) {
    return nwMoviesUsecase.getPopularMovies(params);
  }
}