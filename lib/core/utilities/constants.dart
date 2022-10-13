import 'package:flutter_config/flutter_config.dart';

class Constants {
  static String get movieDBApiKey {
    return FlutterConfig.get('THE_MOVIE_DB_API_KEY');
  }
}
