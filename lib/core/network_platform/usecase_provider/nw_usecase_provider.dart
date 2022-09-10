import 'package:flutter_movie_provider_archs/core/domain/domain.dart';
import 'package:flutter_movie_provider_archs/core/network_platform/network_platform.dart';

class NwUsecaseProvider implements UsecaseProvider {
  @override
  MoviesUsecase getMoviesUsecase() {
    return NwMoviesUsecase(network: Network<Movies>());
  }
}
