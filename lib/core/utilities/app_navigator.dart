import 'package:flutter/material.dart';
import 'package:flutter_movie_provider_archs/core/core.dart';

class AppNavigator {
  static Future<void>? pushFromRoot(String routeName, {Object? arguments, bool }) {
    BuildContext? context = GlobalKeys.appRootNavigatorKey.currentContext;
    if (context == null) { return null; }
    return Navigator.of(context!).pushNamed(routeName, arguments: arguments);
  }
}