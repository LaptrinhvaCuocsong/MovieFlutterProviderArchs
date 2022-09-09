import 'models.dart';

class Movies {
  int? page;
  List<Movie>? results;
  int? totalPages;
  int? totalResults;

  Movies.fromJson(Map<String, dynamic> json) {
    this.page = json['page'];
    this.totalPages = json['total_pages'];
    this.totalResults = json['total_results'];
    var results = json['results'];
    if (results is List) {
      List<Movie> movies = [];
      results.forEach((element) {
        movies.add(Movie.fromJson(element));
      });
      this.results = movies;
    } else {
      this.results = [];
    }
  }
}
