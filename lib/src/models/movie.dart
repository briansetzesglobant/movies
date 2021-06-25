import 'movie_result.dart';

class Movie {
  late int page;
  late int totalResults;
  late int totalPages;
  late List<MovieResult> results;

  Movie({
    required this.page,
    required this.results,
    required this.totalResults,
    required this.totalPages,
  });

  factory Movie.fromJson(
    Map<String, dynamic> parsedJson,
  ) {
    var parsedJsonList = parsedJson['results'] as List;

    List<MovieResult> movieTemporary = parsedJsonList
        .map((eachMovie) => MovieResult.fromJson(eachMovie))
        .toList();

    return Movie(
      page: parsedJson['page'],
      totalResults: parsedJson['total_results'],
      totalPages: parsedJson['total_pages'],
      results: movieTemporary,
    );
  }
}
