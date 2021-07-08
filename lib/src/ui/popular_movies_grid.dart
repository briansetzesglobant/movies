import 'package:flutter/material.dart';
import '../models/movie.dart';
import '../../utils/constants.dart';
import '../resources/movie_strings.dart';
import 'package:widgets/widgets.dart';

class PopularMoviesGrid extends StatelessWidget {
  final Movie movieData;

  const PopularMoviesGrid({
    Key? key,
    required this.movieData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: movieData.results.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: Constants.crossAxisCountNumber,
      ),
      itemBuilder: (
        BuildContext context,
        int index,
      ) {
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (
                  context,
                ) =>
                    MovieDetail(
                  movieReleaseDate:
                      movieData.results[index].releaseDate!.isNotEmpty
                          ? movieData.results[index].releaseDate!
                          : MovieStrings.movieDefaultDate,
                  movieOverview: movieData.results[index].overview,
                  moviePosterPath: movieData.results[index].posterPath,
                  movieTitle: movieData.results[index].title,
                  movieVoteAverage: movieData.results[index].voteAverage.toString(),
                ),
              ),
            );
          },
          child: MovieDetailImage(
            posterPath: movieData.results[index].posterPath,
          ),
        );
      },
    );
  }
}
