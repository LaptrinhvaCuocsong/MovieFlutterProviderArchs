import 'package:flutter/material.dart';

class AppBarImageActionButton extends StatelessWidget {
  final String imageNamed;
  final Color color;
  final VoidCallback onTapped;

  AppBarImageActionButton(
      {required this.imageNamed, required this.color, required this.onTapped});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapped,
      child: Container(
          width: 30,
          height: 30,
          child: Image(
            image: AssetImage(imageNamed),
            color: color,
          )),
    );
  }
}
