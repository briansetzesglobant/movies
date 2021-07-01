import 'package:flutter/material.dart';
import '../../utils/constants.dart';
import '../../utils/text_styles.dart';

class MovieDetailTitle extends StatelessWidget {
  final String title;

  MovieDetailTitle({
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: Constants.paddingTitleTop,
        bottom: Constants.paddingTitleBottom,
      ),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyles.styleTitleDetails,
      ),
    );
  }
}
