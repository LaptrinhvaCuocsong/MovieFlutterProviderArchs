import 'package:flutter_movie_provider_archs/ui/ui.dart';

enum AppTabBar { movies, favorites, settings, about }

class AppTabbarViewModel extends BaseViewModel {
  AppTabBar get tabbarSelected => _tabbarSelected;
  AppTabBar _tabbarSelected = AppTabBar.movies;

  void setTabbarSelected(AppTabBar tabbar, {bool isNeedNotify = true}) {
    _tabbarSelected = tabbar;
    if (isNeedNotify) {
      notifyListeners();
    }
  }
}
