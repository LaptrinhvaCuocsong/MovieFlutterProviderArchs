import 'package:flutter/material.dart';
import 'package:flutter_movie_provider_archs/core/core.dart';

class BaseViewModel extends ChangeNotifier {
  State? widgetState;
  ViewState _state = ViewState.idle;

  ViewState get state => _state;

  void showDialog(DialogContent dialogContent) {
    if (widgetState == null) {
      return;
    }
    widgetState!.widget.showDialog(widgetState!.context, dialogContent);
  }

  void setState(ViewState state) {
    _state = state;
    notifyListeners();
  }
}
