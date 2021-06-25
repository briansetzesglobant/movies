import 'package:flutter/material.dart';
import '../../utils/constants.dart';

class MovieDetailImage extends StatelessWidget {
  final String posterPath;
  final BoxFit imageBoxFit;

  MovieDetailImage({
    required this.posterPath,
    this.imageBoxFit = BoxFit.fill,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        Constants.paddingImage,
      ),
      child: FadeInImage.assetNetwork(
        placeholder: posterPath,
        image: posterPath,
        fit: imageBoxFit,
      ),
    );
  }
}
