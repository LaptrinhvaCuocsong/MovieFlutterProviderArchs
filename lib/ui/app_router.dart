import 'package:flutter/material.dart';
import 'package:flutter_movie_provider_archs/core/core.dart';
import 'package:flutter_movie_provider_archs/ui/screens/screens.dart';

class RouteNames {
  static const topView = '/';
  static const moviesView = '/movies';
  static const favoritesView = '/favorites';
  static const settingsView = '/settings';
  static const aboutView = '/about';
  static const movieDetail = '/movie_detail';
}

class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    dynamic arguments = settings.arguments;
    switch (settings.name) {
      case RouteNames.topView:
        return MaterialPageRoute(builder: (context) => TopView());
      case RouteNames.moviesView:
        return MaterialPageRoute(builder: (context) => MoviesView());
      case RouteNames.favoritesView:
        return MaterialPageRoute(builder: (context) => FavoritesView());
      case RouteNames.settingsView:
        return MaterialPageRoute(builder: (context) => SettingsView());
      case RouteNames.aboutView:
        return MaterialPageRoute(builder: (context) => AboutView());
      case RouteNames.movieDetail:
        if (arguments is Movie) {
          return MaterialPageRoute(
              builder: (context) => MovieDetailView(movie: arguments));
        }
        return null;
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
