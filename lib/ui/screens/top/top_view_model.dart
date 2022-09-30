import 'package:flutter/material.dart';
import 'package:flutter_movie_provider_archs/ui/ui.dart';

class TopViewModel extends BaseViewModel {
  Widget? drawer;

  void showDrawer(Widget drawer) {
    this.drawer = drawer;
    notifyListeners();
  }
}
