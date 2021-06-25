import 'package:flutter/material.dart';
import '../resources/movie_strings.dart';
import '../../utils/constants.dart';
import '../../utils/text_styles.dart';

class MovieDetailInformation extends StatelessWidget {
  final String date;
  final String rating;

  MovieDetailInformation({
    required this.date,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: Constants.paddingInformation,
      ),
      child: Column(
        children: [
          Text(
            MovieStrings.movieDetailDateText + date,
            style: TextStyles.styleInformation,
          ),
          Text(
            MovieStrings.movieDetailRatingText + rating,
            style: TextStyles.styleInformation,
          ),
        ],
      ),
    );
  }
}
