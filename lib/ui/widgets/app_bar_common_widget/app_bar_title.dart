import 'package:flutter/material.dart';
import 'package:flutter_movie_provider_archs/core/core.dart';

class AppBarTitle extends StatelessWidget {
  final String title;
  final Color color;

  AppBarTitle({required this.title, required this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyles.getStyle(18, FontFamilies.roboto, FontWeights.medium,
          color: color),
    );
  }
}
