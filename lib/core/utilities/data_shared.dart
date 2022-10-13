import 'package:flutter/material.dart';
import 'package:flutter_movie_provider_archs/core/core.dart';

class DataShared extends ChangeNotifier {
  static final instance = DataShared._internal();

  MovieImageConfig? get movieImageConfig => _movieImageConfig;
  MovieImageConfig? _movieImageConfig;

  DataShared._internal();

  void setMovieImageConfig(MovieImageConfig imageConfig) {
    _movieImageConfig = imageConfig;
  }
}
