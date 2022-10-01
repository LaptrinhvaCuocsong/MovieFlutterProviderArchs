import 'package:flutter/material.dart';
import 'package:flutter_movie_provider_archs/ui/ui.dart';

// ignore: must_be_immutable
class TopView extends StatelessWidget {
  late TopViewModel _viewModel;

  @override
  Widget build(BuildContext context) {
    return BaseView<TopViewModel>(
      onViewModelReady: (viewModel) {
        _viewModel = viewModel;
      },
      builder: (context, viewModel, child) {
        return Scaffold(
          body: Builder(builder: (context) {
            _showDrawerIfNeed(context);
            return AppTabbarView();
          }),
          drawer: viewModel.drawer,
          drawerEnableOpenDragGesture: false,
        );
      },
    );
  }

  void _showDrawerIfNeed(BuildContext context) {
    if (!_viewModel.isNeedShowDrawer) {
      return;
    }
    _viewModel.setNeedShowDrawer(false);
    Future.delayed(Duration(milliseconds: 200)).then((value) {
      Scaffold.of(context).openDrawer();
    });
  }
}
