import 'package:flutter/material.dart';
import 'package:flutter_movie_provider_archs/core/core.dart';

class AppBarBackButton extends StatelessWidget {
  final String backTitle;
  final VoidCallback onTapped;
  final Color color;

  AppBarBackButton(
      {required this.backTitle, required this.onTapped, required this.color});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapped,
        child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image(
          image: AssetImage(Images.icBack),
          color: color,
        ),
        backTitle.isEmpty
            ? SizedBox()
            : Text(
                backTitle,
                style: TextStyles.getStyle(
                    16, FontFamilies.roboto, FontWeights.medium,
                    color: color),
              )
      ],
    ));
  }
}
