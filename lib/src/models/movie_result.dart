import 'dart:convert';
import '../../utils/constants.dart';
import '../resources/movie_strings.dart';

class MovieResult {
  int? voteCount;
  int? id;
  bool? video;
  var voteAverage;
  String title;
  var popularity;
  late String posterPath;
  String? originalLanguage;
  String? originalTitle;
  List<int>? genreIds;
  String? backdropPath;
  bool? adult;
  String overview;
  String? releaseDate;

  MovieResult({
    this.voteCount,
    this.id,
    this.video,
    this.voteAverage = Constants.voteAverage,
    this.title = MovieStrings.emptyString,
    this.popularity,
    required this.posterPath,
    this.originalLanguage,
    this.originalTitle,
    this.genreIds,
    this.backdropPath,
    this.adult,
    this.overview = MovieStrings.emptyString,
    this.releaseDate,
  });

  factory MovieResult.fromJson(Map<String, dynamic> parsedJson,
      {bool db = false}) {
    var genresJsonList = (!db
        ? parsedJson['genre_ids']
        : json.decode(parsedJson['genre_ids'] ?? '[]')) as List?;
    List<int> genreList = [];
    for (int i = 0; i < (genresJsonList?.length ?? 0); i++) {
      genreList.add(genresJsonList?[i]);
    }

    return MovieResult(
      voteCount: parsedJson['vote_count'],
      id: parsedJson['id'],
      video: !db
          ? parsedJson['video']
          : (parsedJson['video'] != null ? (parsedJson['video'] == 1) : null),
      voteAverage: double.tryParse(parsedJson['vote_average'].toString()),
      title: parsedJson['title'],
      popularity: double.tryParse(parsedJson['popularity'].toString()),
      posterPath: parsedJson['poster_path'] != null
          ? MovieStrings.imageNetwork + parsedJson['poster_path']
          : MovieStrings.imageDefault,
      originalLanguage: parsedJson['original_language'],
      originalTitle: parsedJson['original_title'],
      genreIds: genreList,
      backdropPath: parsedJson['backdrop_path'] != null
          ? MovieStrings.imageNetwork + parsedJson['backdrop_path']
          : MovieStrings.imageDefault,
      adult: !db
          ? parsedJson['adult']
          : (parsedJson['adult'] != null ? (parsedJson['adult'] == 1) : null),
      overview: parsedJson['overview'],
      releaseDate: parsedJson['release_date'] != null
          ? parsedJson['release_date']
          : MovieStrings.movieDefaultDate,
    );
  }

  Map<String, dynamic> toJson({bool db = false}) {
    return <String, dynamic>{
      'vote_count': voteCount,
      'id': id,
      'video': !db ? video : (video != null ? (video! ? 1 : 0) : null),
      'vote_average': voteAverage,
      'title': title,
      'popularity': popularity,
      'poster_path': posterPath,
      'original_language': originalLanguage,
      'original_title': originalTitle,
      'genre_ids': !db
          ? genreIds?.map((genreId) => genreId).toList()
          : json.encode(genreIds ?? []),
      'backdrop_path': backdropPath,
      'adult': !db ? adult : (adult != null ? (adult! ? 1 : 0) : null),
      'overview': overview,
      'release_date': releaseDate,
    };
  }
}
