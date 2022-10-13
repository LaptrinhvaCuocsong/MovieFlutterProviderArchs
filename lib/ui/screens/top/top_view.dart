import 'package:flutter/material.dart';
import 'package:flutter_movie_provider_archs/ui/ui.dart';

class TopView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<TopViewModel>(
      onViewModelReady: (viewModel) {},
      builder: (context, viewModel, child) {
        return Scaffold(
            body: Builder(builder: (context) {
              if (viewModel.isNeedShowDrawer) {
                Future.delayed(Duration(milliseconds: 100)).then((value) {
                  Scaffold.of(context).openDrawer();
                });
                viewModel.setIsNeedShowDrawer(false);
              }
              return AppTabbarView();
            }),
            drawer: viewModel.drawer,
            drawerEnableOpenDragGesture: false);
      },
    );
  }
}
