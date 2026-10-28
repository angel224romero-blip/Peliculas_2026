import 'dart:convert';

class Movie {

  bool adult;
  String? backdropPath;
  List<int> genreIds;
  int id;
  String originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  String? posterPath;
  DateTime releaseDate;
  String title;
  bool video;
  double voteAverage;
  int voteCount;

  String? heroId;

  Movie({
    required this.adult,
    this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
    this.heroId,
  });

  String get fullPosterImg {

    if (posterPath != null) {
      return 'https://image.tmdb.org/t/p/w500$posterPath';
    }

    return 'https://i.stack.imgur.com/GNhxO.png';
  }

  factory Movie.fromRawJson(String str) =>
      Movie.fromJson(json.decode(str));

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
    adult: json["adult"] ?? false,
    backdropPath: json["backdrop_path"],
    genreIds: List<int>.from(
      (json["genre_ids"] ?? []).map((x) => x),
    ),
    id: json["id"],
    originalLanguage:
    json["original_language"] ?? '',
    originalTitle:
    json["original_title"] ?? '',
    overview: json["overview"] ?? '',
    popularity:
    (json["popularity"] ?? 0).toDouble(),
    posterPath: json["poster_path"],
    releaseDate:
    DateTime.tryParse(json["release_date"] ?? '') ??
        DateTime(1900),
    title: json["title"] ?? '',
    video: json["video"] ?? false,
    voteAverage:
    (json["vote_average"] ?? 0).toDouble(),
    voteCount: json["vote_count"] ?? 0,
  );
}