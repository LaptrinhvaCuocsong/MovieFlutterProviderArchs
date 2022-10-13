import 'package:flutter_movie_provider_archs/core/core.dart';

abstract class MovieImageConfigUsecase {
  Future<Result<MovieImageConfig, Exception>> getImageConfiguration(
      Map<String, dynamic> params);
}
