import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movies/src/models/movie.dart';
import 'package:movies/src/models/movie_result.dart';
import 'package:movies/src/ui/popular_movies_grid.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:widgets/widgets.dart';

void main() {
  late Movie responseWithNoMovies;
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
  });

  group("Generate a grid with and without data", () {
    testWidgets(
      "Generate a grid without data",
      (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: PopularMoviesGrid(
                movieData: responseWithNoMovies,
              ),
            ),
          ),
        );

        expect(
          find.byType(
            GridView,
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: find.byType(
              GridView,
            ),
            matching: find.byType(
              InkWell,
            ),
          ),
          findsNothing,
        );
      },
    );

    testWidgets(
      "Generate a grid with data",
      (WidgetTester tester) async {
        await mockNetworkImagesFor(
          () => tester.pumpWidget(
            MaterialApp(
              home: Scaffold(
                body: PopularMoviesGrid(
                  movieData: responseWithMovies,
                ),
              ),
            ),
          ),
        );

        expect(
          find.byType(
            GridView,
          ),
          findsOneWidget,
        );
        expect(
          find.byType(
            GridView,
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: find.byType(
              GridView,
            ),
            matching: find.byType(
              InkWell,
            ),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: find.byType(
              GridView,
            ),
            matching: find.byType(
              MovieDetailImage,
            ),
          ),
          findsOneWidget,
        );
      },
    );
  });
}
