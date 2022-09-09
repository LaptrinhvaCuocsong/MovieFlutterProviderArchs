import 'package:flutter_movie_provider_archs/core/domain/usecase/usecase.dart';

abstract class UsecaseProvider {
  MoviesUsecase getMoviesUsecase();
}
