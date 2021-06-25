import 'package:flutter/material.dart';
import '../../utils/constants.dart';
import '../../utils/text_styles.dart';

class MovieDetailOverview extends StatelessWidget {
  final String overview;

  MovieDetailOverview({
    required this.overview,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        Constants.paddingOverview,
      ),
      child: Text(
        overview,
        textAlign: TextAlign.center,
        style: TextStyles.styleOverview,
      ),
    );
  }
}
