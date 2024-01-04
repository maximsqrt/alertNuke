import 'package:flutter/material.dart';

class LogoImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Image(
          image: AssetImage("assets/logo.png"),
          width: 100,
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}