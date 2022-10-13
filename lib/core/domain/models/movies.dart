import 'package:flutter_movie_provider_archs/core/core.dart';

class Movies {
  int? page;
  List<Movie>? results;
  int? totalPages;
  int? totalResults;

  Movies.fromJson(Map<String, dynamic> json) {
    this.page = tryCast(json['page']);
    this.totalPages = tryCast(json['total_pages']);
    this.totalResults = tryCast(json['total_results']);
    this.results = tryCast<List>(json['results'])
        ?.cast<Map<String, dynamic>>()
        ?.map((e) => Movie.fromJson(e))
        .toList();
  }
}
