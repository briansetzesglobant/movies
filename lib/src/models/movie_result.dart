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
    this.voteAverage = 0.0,
    this.title = "",
    this.popularity,
    required this.posterPath,
    this.originalLanguage,
    this.originalTitle,
    this.genreIds,
    this.backdropPath,
    this.adult,
    this.overview = "",
    this.releaseDate,
  });

  factory MovieResult.fromJson(Map<String, dynamic> parsedJson) {
    var parsedJsonList = parsedJson['genre_ids'] as List;
    List<int> genreList = [];
    for (int i = 0; i < parsedJsonList.length; i++) {
      genreList.add(parsedJsonList[i]);
    }

    return MovieResult(
      voteCount: parsedJson['vote_count'],
      id: parsedJson['id'],
      video: parsedJson['video'],
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
      adult: parsedJson['adult'],
      overview: parsedJson['overview'],
      releaseDate: parsedJson['release_date'] != null
          ? parsedJson['release_date']
          : "Without date",
    );
  }
}
