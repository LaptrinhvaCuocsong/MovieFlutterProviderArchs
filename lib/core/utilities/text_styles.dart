import 'package:flutter/material.dart';

enum FontFamilies { roboto }

String stringFromFontFamily(FontFamilies fontFamily) {
  switch (fontFamily) {
    case FontFamilies.roboto:
      return 'Roboto';
  }
}

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
  static TextStyle getStyle(
      double fontSize, FontFamilies fontFamily, FontWeights fontWeight) {
    return TextStyle(
        fontSize: fontSize,
        fontFamily: stringFromFontFamily(fontFamily),
        fontWeight: getFontWeight(fontWeight));
  }
}
