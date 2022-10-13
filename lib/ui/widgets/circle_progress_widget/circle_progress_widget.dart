import 'package:flutter/material.dart';
import 'package:flutter_movie_provider_archs/core/core.dart';

class CircleProgressWidget extends StatelessWidget {
  final double size;
  final double stroke;
  final Color strokeColor;

  CircleProgressWidget({required this.strokeColor, this.size = 60.0, this.stroke = 5.0});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: size,
        height: size,
        child: CircularProgressIndicator(
          color: AppColor.primaryColor,
          strokeWidth: stroke,
        ),
      ),
    );
  }
}
