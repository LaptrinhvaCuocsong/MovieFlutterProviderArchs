import 'package:flutter/cupertino.dart';
import 'package:flutter_movie_provider_archs/core/core.dart';
import 'package:flutter_movie_provider_archs/ui/ui.dart';

// ignore: must_be_immutable
class AppTabbarView extends StatelessWidget {
  final CupertinoTabController _tabController = CupertinoTabController();
  late AppTabbarViewModel _viewModel;

  AppTabbarView() {
    _tabController.addListener(() {
      AppTabBar tabbar = AppTabBar.values[_tabController.index];
      _viewModel.setTabbarSelected(tabbar, isNeedNotify: false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<AppTabbarViewModel>(
      onViewModelReady: (viewModel) {
        this._viewModel = viewModel;
      },
      builder: ((context, viewModel, child) {
        _tabController.index = viewModel.tabbarSelected.index;
        return CupertinoTabScaffold(
            tabBar: _buildBottomTabbar(),
            controller: _tabController,
            tabBuilder: (context, index) => CupertinoTabView(
                  builder: (context) => _buildTabView(index),
                  navigatorKey: GlobalKeys.appBarNavigatorKey,
                  onGenerateRoute: AppRouter.onGenerateRoute,
                ));
      }),
    );
  }

  Widget _buildTabView(int index) {
    AppTabBar tabbar = AppTabBar.values[index];
    switch (tabbar) {
      case AppTabBar.movies:
        return MoviesView();
      case AppTabBar.favorites:
        return FavoritesView();
      case AppTabBar.settings:
        return SettingsView();
      case AppTabBar.about:
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
