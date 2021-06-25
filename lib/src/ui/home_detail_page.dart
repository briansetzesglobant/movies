import 'package:flutter/material.dart';
import '../../utils/constants.dart';
import '../widgets/movie_detail_button.dart';
import '../widgets/movie_detail_title.dart';
import '../widgets/movie_detail_image.dart';
import '../widgets/movie_detail_information.dart';
import '../widgets/movie_detail_overview.dart';

class HomeDetailPage extends StatelessWidget {
  final String movieTitle;
  final String moviePosterPath;
  final String movieReleaseDate;
  final double movieVoteAverage;
  final String movieOverview;

  HomeDetailPage({
    required this.movieTitle,
    required this.movieOverview,
    required this.movieReleaseDate,
    required this.moviePosterPath,
    required this.movieVoteAverage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(Constants.paddingHomeDetails),
        child: MovieDetailButton(),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              MovieDetailTitle(
                title: movieTitle,
              ),
              MovieDetailImage(
                posterPath: moviePosterPath,
              ),
              MovieDetailInformation(
                date: movieReleaseDate,
                rating: movieVoteAverage.toString(),
              ),
              MovieDetailOverview(
                overview: movieOverview,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
