import 'package:flutter_movie_provider_archs/core/core.dart';

class Movie {
  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate; // yyyy-MM-dd
  String? title;
  bool? video;
  double? voteAverage;
  double? voteCount;

  Movie(
      {this.adult,
      this.backdropPath,
      this.genreIds,
      this.id,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.releaseDate,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount});

  Movie.fromJson(Map<String, dynamic> json) {
    adult = tryCast(json['adult']);
    backdropPath = tryCast(json['backdrop_path']);
    genreIds = tryCast<List<dynamic>>(json['genre_ids'])
        ?.map((e) => tryCast<num>(e)?.toInt() ?? 0)
        .toList();
    id = tryCast<num>(json['id'])?.toInt();
    originalLanguage = tryCast(json['original_language']);
    originalTitle = tryCast(json['original_title']);
    overview = tryCast(json['overview']);
    popularity = tryCast<num>(json['popularity'])?.toDouble();
    posterPath = tryCast(json['poster_path']);
    releaseDate = tryCast(json['release_date']);
    title = tryCast(json['title']);
    video = tryCast(json['video']);
    voteAverage = tryCast<num>(json['vote_average'])?.toDouble();
    voteCount = tryCast<num>(json['vote_count'])?.toDouble();
  }

  String? getReleaseDateFormatted(String format) {
    if (releaseDate != null) {
      return DateFormatter.getDateTimeFormatted(
          releaseDate!, "yyyy-MM-dd", format);
    }
    return null;
  }

  String? getRatingFormatted() {
    if (voteAverage != null) {
      return voteAverage!.toString() + "/10";
    }
    return null;
  }
}
