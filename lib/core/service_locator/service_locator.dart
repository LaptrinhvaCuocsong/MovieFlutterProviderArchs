import 'package:flutter_movie_provider_archs/core/core.dart';
import 'package:flutter_movie_provider_archs/main.dart';
import 'package:flutter_movie_provider_archs/ui/ui.dart';

enum DependencyInstance { nwUsecaseProvider, nwMoviesUsecase }

class ServiceLocator {
  static final instance = ServiceLocator._internal();

  ServiceLocator._internal();

  void registerDependencies() {
    _registerUseCase();
    _registerRepository();
    _registerViewModel();
  }

  void _registerUseCase() {
    locator.registerLazySingleton<UsecaseProvider>(() => NwUsecaseProvider(),
        instanceName: DependencyInstance.nwUsecaseProvider.name);

    locator.registerFactory<MoviesUsecase>(
        () => locator<UsecaseProvider>(
                instanceName: DependencyInstance.nwUsecaseProvider.name)
            .getMoviesUsecase(),
        instanceName: DependencyInstance.nwMoviesUsecase.name);
  }

  void _registerRepository() {
    locator.registerLazySingleton<MoviesRepository>(() => MoviesRepositoryImpl(
        nwMoviesUsecase: locator<MoviesUsecase>(
            instanceName: DependencyInstance.nwMoviesUsecase.name)));
  }

  void _registerViewModel() {
    locator.registerLazySingleton<TopViewModel>(() => TopViewModel());
    locator
        .registerLazySingleton<AppTabbarViewModel>(() => AppTabbarViewModel());
  }
}
