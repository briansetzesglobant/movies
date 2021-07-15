import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movies/src/blocs/movie_bloc.dart';
import 'package:movies/src/models/movie.dart';
import 'package:movies/src/models/movie_result.dart';
import 'package:movies/src/resources/movie_repository.dart';
import 'package:movies/src/ui/home_page.dart';

import 'movie_bloc_test.mocks.dart';

@GenerateMocks([
  MovieRepository,
])
void main() {
  late Movie responseWithNoMovies;
  late MockMovieRepository repository;
  late MovieBloc bloc;
  late MovieResult movieResult;
  late Movie responseWithMovies;

  Movie _movieList(int pageParameter, int totalPagesParameter,
      int totalResultsParameter, List<MovieResult> resultsParameter) {
    return Movie(
      page: pageParameter,
      totalPages: totalPagesParameter,
      totalResults: totalResultsParameter,
      results: resultsParameter,
    );
  }

  setUp(() {
    responseWithNoMovies = _movieList(1, 5, 3, []);
    repository = MockMovieRepository();
    bloc = MovieBloc(repository: repository);
    when(repository.fetchAllMovies()).thenAnswer(
      (_) async => responseWithNoMovies,
    );

    movieResult = MovieResult(
      title: "Luca",
      posterPath:
          "https://image.tmdb.org/t/p/w185/jTswp6KyDYKtvC52GbHagrZbGvD.jpg",
      releaseDate: "2021-06-17",
      voteAverage: "8.2",
      overview:
          "Luca and his best friend Alberto experience an unforgettable summer on the Italian Riviera. But all the fun is threatened by a deeply-helped secret: they are sea monsters from another world just below the water's a surface.",
    );
    responseWithMovies = _movieList(2, 10, 6, [movieResult]);
    when(repository.searchByMovieName("Luca")).thenAnswer(
      (_) async => responseWithMovies,
    );
  });

  testWidgets(
    "Generate main screen",
    (tester) async {
      await tester.runAsync(
        () async {
          await tester.pumpWidget(
            MaterialApp(
              home: HomePage(
                title: "Movies App",
                bloc: bloc,
              ),
            ),
          );
        },
      );
      await tester.pump();
      expect(
        responseWithNoMovies.results,
        isEmpty,
      );
      expect(
        find.byType(
          GridView,
        ),
        findsOneWidget,
      );

      await tester.enterText(
        find.byType(TextField),
        "Luca",
      );
      await tester.sendKeyEvent(
        LogicalKeyboardKey.enter,
      );
      await tester.pump();
      expect(
        find.text(
          "Luca",
        ),
        findsOneWidget,
      );
      expect(
        find.byType(
          GridView,
        ),
        findsOneWidget,
      );
    },
  );
}
