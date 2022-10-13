import 'package:flutter_movie_provider_archs/core/core.dart';

class NwImageConfigurationUsecase implements MovieImageConfigUsecase {
  final Network<MovieImageConfig> network;

  NwImageConfigurationUsecase({required this.network});

  @override
  Future<Result<MovieImageConfig, Exception>> getImageConfiguration(
      Map<String, dynamic> params) {
    MovieUrlRequestBuilder request = MovieUrlRequestBuilder(
        APIMethod.get, '/3/configuration',
        parameters: params);
    return network.execute(
        request, (json) => MovieImageConfig.fromJson(json));
  }
}
