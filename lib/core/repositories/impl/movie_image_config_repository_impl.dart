import 'package:flutter_movie_provider_archs/core/core.dart';

class MovieImageConfigRepositoryImpl implements MovieImageConfigRepository {
  final MovieImageConfigUsecase nwMovieImageConfigUsecase;

  MovieImageConfigRepositoryImpl({required this.nwMovieImageConfigUsecase});

  @override
  Future<Result<MovieImageConfig, Exception>> getMovieImageConfig() {
    return nwMovieImageConfigUsecase.getImageConfiguration({});
  }
}
