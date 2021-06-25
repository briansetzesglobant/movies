import 'package:flutter/material.dart';
import '../../utils/text_styles.dart';
import '../../utils/constants.dart';

class MovieDetailButton extends StatelessWidget {
  MovieDetailButton();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Constants.paddingButton,
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith(
            (
              states,
            ) =>
                Colors.black,
          ),
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(Constants.paddingButtonChildren),
              child: Icon(
                Icons.arrow_back_sharp,
                size: Constants.paddingButtonIconSize,
                color: Colors.white,
              ),
            ),
            Text(
              "BACK",
              style: TextStyles.styleButton,
            ),
          ],
        ),
      ),
    );
  }
}
