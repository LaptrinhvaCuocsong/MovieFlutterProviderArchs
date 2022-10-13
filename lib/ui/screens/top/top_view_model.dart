import 'package:flutter/material.dart';
import 'package:flutter_movie_provider_archs/ui/ui.dart';

class TopViewModel extends BaseViewModel {
  Widget? get drawer => _drawer;
  bool get isNeedShowDrawer => _isNeedShowDrawer;
  Widget? _drawer;
  bool _isNeedShowDrawer = false;

  void showDrawer(Widget drawer) {
    _drawer = drawer;
    _isNeedShowDrawer = true;
    notifyListeners();
  }

  void setIsNeedShowDrawer(bool isNeedShowDrawer) {
    _isNeedShowDrawer = isNeedShowDrawer;
  }
}
