// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class LogoImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Image(
          image: AssetImage("assets/logo.png"),
          width: 100,
        ),
        SizedBox(height: 10),
      ],
    );
  }
}



class LogoBackgroundImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Image(
          image: AssetImage("assets/settingsbackgrnd.png"),
          
        ),
        SizedBox(height: 10),
      ],
    );
  }
}



