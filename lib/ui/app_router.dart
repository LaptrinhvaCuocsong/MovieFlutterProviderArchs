import 'package:flutter/material.dart';
import 'package:flutter_movie_provider_archs/ui/screens/screens.dart';

class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => TopView());
      case '/movies':
        return MaterialPageRoute(builder: (context) => MoviesView());
      case '/favorites':
        return MaterialPageRoute(builder: (context) => FavoritesView());
      case '/settings':
        return MaterialPageRoute(builder: (context) => SettingsView());
      case '/about':
        return MaterialPageRoute(builder: (context) => AboutView());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}.'),
            ),
          ),
        );
    }
  }
}
