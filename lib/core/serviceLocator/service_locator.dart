import 'package:flutter_movie_provider_archs/core/core.dart';
import 'package:get_it/get_it.dart';

enum DependencyInstance { nwUsecaseProvider, nwMoviesUsecase }

class ServiceLocator {
  static final instance = ServiceLocator._internal();

  ServiceLocator._internal();

  GetIt getIt = GetIt.instance;

  void registerDependencies() {
    getIt.registerLazySingleton<UsecaseProvider>(() => NwUsecaseProvider(),
        instanceName: DependencyInstance.nwUsecaseProvider.name);
    getIt.registerFactory<MoviesUsecase>(
        () => getIt<UsecaseProvider>(
                instanceName: DependencyInstance.nwUsecaseProvider.name)
            .getMoviesUsecase(),
        instanceName: DependencyInstance.nwMoviesUsecase.name);
    getIt.registerLazySingleton<MoviesRepository>(() => MoviesRepositoryImpl(
        nwMoviesUsecase: getIt<MoviesUsecase>(
            instanceName: DependencyInstance.nwMoviesUsecase.name)));
  }
}