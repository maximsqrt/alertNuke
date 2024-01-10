import 'dart:ui';

import 'package:flutter/material.dart';


class MonthColor {
  static const Color primaryColor = Color(0xFF6CA7BE);
  static const Color secondaryColor = Color(0xFF2E0B4B);

  static LinearGradient fancyLinearGradient() {
    return const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [primaryColor, secondaryColor],
      stops: [0.2, 0.7],
      tileMode: TileMode.repeated,
      transform: GradientRotation(45 * 3.1415926535897932 / 180),
    );
  }
}


class JPfancyColor {
  static LinearGradient jpFancyColor() {
    return const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      stops: [0.5, 0.9],
      colors: [
        Color(0xFF884082),
        Color(0xFF1E1854),
      
      ],
    );
  }
}
// Background Month // Week // Day 
class BackgroundColor { 



  static const Color primaryColor = Color(0xFF250E22);
}