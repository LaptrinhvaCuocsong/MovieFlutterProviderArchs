import 'package:flutter/material.dart';
import 'package:flutter_movie_provider_archs/core/core.dart';

class AppNavigator {
  static Future<void>? pushOn(BuildContext context, String routeName,
      {Object? arguments, bool isRemoveAfterPush = false}) {
    if (isRemoveAfterPush) {
      return Navigator.of(context).pushNamedAndRemoveUntil(
          routeName, (route) => false,
          arguments: arguments);
    } else {
      return Navigator.of(context).pushNamed(routeName, arguments: arguments);
    }
  }

  static Future<void>? pushFromRoot(String routeName,
      {Object? arguments, bool isRemoveAfterPush = false}) {
    return navigatorWithKey(GlobalKeys.appRootNavigatorKey, routeName,
        arguments: arguments, isRemoveAfterPush: isRemoveAfterPush);
  }

  static Future<void>? navigatorWithKey(
      GlobalKey<NavigatorState> navKey, String routeName,
      {Object? arguments, bool isRemoveAfterPush = false}) {
    BuildContext? context = navKey.currentContext;
    if (context == null) {
      return null;
    }
    if (isRemoveAfterPush) {
      return Navigator.of(context).pushNamedAndRemoveUntil(
          routeName, (route) => false,
          arguments: arguments);
    } else {
      return Navigator.of(context).pushNamed(routeName, arguments: arguments);
    }
  }
}
