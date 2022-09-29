import 'package:flutter/cupertino.dart';
import 'package:flutter_movie_provider_archs/core/core.dart';
import 'package:flutter_movie_provider_archs/ui/ui.dart';

enum TabBar { movies, favorites, settings, about }

class TopView extends BaseView<TopViewModel> {
  final CupertinoTabController _tabController = CupertinoTabController();

  TopView(
      {required Widget Function(
              BuildContext context, TopViewModel viewModel, Widget? child)
          builder,
      required void Function(BuildContext co) onViewModelReady})
      : super(builder: builder, onViewModelReady: onViewModelReady);

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: _buildBottomTabbar(),
        controller: _tabController,
        tabBuilder: (context, index) => CupertinoTabView(
              builder: (context) => _buildTabView(index),
            ));
  }

  Widget _buildTabView(int index) {
    TabBar tabbar = TabBar.values[index];
    switch (tabbar) {
      case TabBar.movies:
        return MoviesView();
      case TabBar.favorites:
        return FavoritesView();
      case TabBar.settings:
        return SettingsView();
      case TabBar.about:
        return AboutView();
    }
  }

  CupertinoTabBar _buildBottomTabbar() {
    return CupertinoTabBar(
        activeColor: AppColor.primaryColor,
        inactiveColor: AppColor.lightGrayColor,
        items: const [
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(Images.icHomeTabbar)),
              label: 'Movies'),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(Images.icFavoriteTabbar)),
              label: 'Favorites'),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(Images.icSettingTabbar)),
              label: 'Settings'),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(Images.icAboutTabbar)), label: 'About')
        ]);
  }
}
