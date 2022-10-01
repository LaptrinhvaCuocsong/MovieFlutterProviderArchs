import 'package:flutter/material.dart';
import 'package:flutter_movie_provider_archs/core/core.dart';

enum FontFamilies { roboto }

enum FontWeights { bold, medium, regular, light }

FontWeight getFontWeight(FontWeights fontWeight) {
  switch (fontWeight) {
    case FontWeights.bold:
      return FontWeight.w700;
    case FontWeights.medium:
      return FontWeight.w500;
    case FontWeights.regular:
      return FontWeight.w400;
    case FontWeights.light:
      return FontWeight.w300;
  }
}

class TextStyles {
  static TextStyle getStyle(double fontSize, FontFamilies fontFamily,
      FontWeights fontWeight, {Color color = Colors.black}) {
    return TextStyle(
        fontSize: fontSize,
        fontFamily: fontFamily.name.capitalizeFirstLetter(),
        fontWeight: getFontWeight(fontWeight),
        color: color);
  }
}
