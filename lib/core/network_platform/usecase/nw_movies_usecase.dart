import 'package:flutter_movie_provider_archs/core/core.dart';

class NwMoviesUsecase implements MoviesUsecase {
  final Network<Movies> network;

  NwMoviesUsecase({required this.network});

  @override
  Future<Result<Movies, Exception>> getPopularMovies(
      Map<String, dynamic> params) {
    MovieUrlRequestBuilder request = MovieUrlRequestBuilder(
        APIMethod.get, '/3/movie/popular', parameters: params);
    return network.execute(request, (json) => Movies.fromJson(json));
  }
}
