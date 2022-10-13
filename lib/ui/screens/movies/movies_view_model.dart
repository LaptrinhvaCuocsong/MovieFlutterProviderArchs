import 'package:flutter_movie_provider_archs/core/core.dart';
import 'package:flutter_movie_provider_archs/main.dart';
import 'package:flutter_movie_provider_archs/ui/ui.dart';

class MoviesViewModel extends BaseViewModel {
  MoviesRepository _moviesRepository = locator<MoviesRepository>();
  List<Movie> _movies = [];
  bool _isDisplayByList = true;

  bool get isDisplayByList => _isDisplayByList;

  List<Movie> get movies => _movies;

  void setDisplayByList(bool isDisplayByList) {
    _isDisplayByList = isDisplayByList;
    notifyListeners();
  }

  Future<void> getMovies() async {
    setState(ViewState.busy);
    Result<Movies, Exception> result =
        await _moviesRepository.getPopularMovies({});
    if (result.isSuccess) {
      _movies = result.data?.results ?? [];
    } else {
      String error = result.error?.toString() ?? "";
      showDialog(DialogContent(content: error));
    }
    setState(ViewState.idle);
  }
}
