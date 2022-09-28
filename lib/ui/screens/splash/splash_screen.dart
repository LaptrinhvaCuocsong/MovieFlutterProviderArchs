import 'package:flutter/material.dart';
import 'package:flutter_movie_provider_archs/core/core.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(Strings.apiErrorMessage),
      ),
    );
  }
}
