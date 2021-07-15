import 'package:flutter_test/flutter_test.dart';
import 'package:movies/src/models/movie.dart';
import 'package:movies/src/resources/movie_api_provider.dart';

void main() {
  late MovieApiProvider moviesApiProvider;
  setUp(() {
    moviesApiProvider = MovieApiProvider();
  });

  group("Search of general movies and specific by name", () {
    test("It should be generated a list of movies", () async {
      Movie movie = await moviesApiProvider.fetchAllMovies();
      expect(
        movie.results,
        isNotEmpty,
      );
    });

    test("It should be generated a list of movies based on a search", () async {
      Movie movie = await moviesApiProvider.searchByMovieName(
        "Luca",
      );
      expect(
        movie.results,
        isNotEmpty,
      );
    });

    test("It should be generated a list of movies based on a search", () async {
      Movie movie = await moviesApiProvider.searchByMovieName(
        "wxyz",
      );
      expect(
        movie.results,
        isEmpty,
      );
    });

    test("It should be generated a list of movies based on a search", () async {
      expect(
        () => moviesApiProvider.searchByMovieName(
          "",
        ),
        throwsA(
          isA<Exception>(),
        ),
      );
    });
  });
}
