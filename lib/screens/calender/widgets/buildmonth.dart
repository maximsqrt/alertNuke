import 'package:alertnukeapp/screens/calender/year/year.dart';
import 'package:alertnukeapp/themes/colors.dart';
import 'package:flutter/material.dart';

import 'package:alertnukeapp/screens/calender/year/year.dart';
import 'package:flutter/material.dart';

Widget buildMonthPage(int month, double childAspectRatio, int fontSize) {
  int actualFontSize = fontSize;
  return Container(
    decoration: BoxDecoration(
      gradient: MonthColor.fancyLinearGradient(), // Use the gradient from MonthColor
    ),
    child: GridView.builder(
      padding: EdgeInsets.zero,
      itemCount: daysInMonth(month),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        mainAxisSpacing: 0,
        crossAxisSpacing: 0,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (context, index) {
        return AspectRatio(
          aspectRatio: 1.0,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: 0.80,
                color: const Color.fromARGB(117, 127, 76, 229),
              ),
              borderRadius: BorderRadius.circular(3.0),
            ),
            child: Center(
              child: Text(
                (index + 1).toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: actualFontSize.toDouble(),
                  color: Color.fromARGB(187, 233, 220, 220),
                ),
              ),
            ),
          ),
        );
      },
    ),
  );
}
