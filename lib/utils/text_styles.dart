import 'package:flutter/material.dart';
import 'constants.dart';

abstract class TextStyles {
  static const TextStyle styleTitle = TextStyle(
    backgroundColor: Colors.tealAccent,
    fontSize: Constants.textStyleFontSize,
    letterSpacing: Constants.textStyleLetterSpacing,
    color: Colors.black,
  );
  static const TextStyle styleSearch = TextStyle(
    color: Colors.black,
  );
}
