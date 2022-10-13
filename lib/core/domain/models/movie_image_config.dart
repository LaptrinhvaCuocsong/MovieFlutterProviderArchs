import 'package:flutter_movie_provider_archs/core/core.dart';

class MovieImageConfig {
  _Images? images;

  MovieImageConfig({this.images});

  MovieImageConfig.fromJson(Map<String, dynamic> json) {
    images = json['images'] != null ? _Images.fromJson(json['images']) : null;
  }
}

class _Images {
  String? baseUrl;
  String? secureBaseUrl;
  List<String>? backdropSizes;
  List<String>? logoSizes;
  List<String>? posterSizes;
  List<String>? profileSizes;
  List<String>? stillSizes;

  _Images(
      {this.baseUrl,
      this.secureBaseUrl,
      this.backdropSizes,
      this.logoSizes,
      this.posterSizes,
      this.profileSizes,
      this.stillSizes});

  _Images.fromJson(Map<String, dynamic> json) {
    baseUrl = tryCast(json['base_url']);
    secureBaseUrl = tryCast(json['secure_base_url']);
    backdropSizes = tryCast<List>(json['backdrop_sizes'])?.cast<String>();
    logoSizes = tryCast<List>(json['logo_sizes'])?.cast<String>();
    posterSizes = tryCast<List>(json['poster_sizes'])?.cast<String>();
    profileSizes = tryCast<List>(json['profile_sizes'])?.cast<String>();
    stillSizes = tryCast<List>(json['still_sizes'])?.cast<String>();
  }
}
