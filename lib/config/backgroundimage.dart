// Builds the background image with color filter
  import 'package:alertnukeapp/screens/views/logo.dart';
import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
@override
Widget build(BuildContext context) {
    var logoBackgroundImage = LogoBackgroundImage();

    // Positioned fill to cover the entire screen
    return Positioned.fill(
      child: ColorFiltered(
        // Color filter for background tint
        colorFilter: const ColorFilter.mode(
          Color.fromARGB(105, 218, 234, 247),
          BlendMode.srcIn,
        ),
        // Padding to adjust the position of the background image
        child: Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.2),
          // LogoBackgroundImage widget
          child: logoBackgroundImage,
        ),
      ),
    );
}
}