import 'package:alertnukeapp/application/DateHelperService.dart';
import 'package:alertnukeapp/config/colors.dart';
import 'package:flutter/material.dart';

Widget buildMonthPage(int monthIndex,int? selectedYear, double childAspectRatio, int fontSize, {required Function(int) dayCallback}) {
  int actualFontSize = fontSize;
  // Anpassung hier: Monatsindex + 1, um von 0-basierter zu 1-basierter Indexierung zu wechseln
  int correctedMonthIndex = monthIndex + 1;
  int year = selectedYear ?? DateTime.now().year;
  return Container(
    decoration: BoxDecoration(
      gradient: MonthColor.fancyLinearGradient(),
    ),
    child: GridView.builder(
      padding: EdgeInsets.zero,
      itemCount: dateHelperService.daysInMonth(correctedMonthIndex, year), // Korrigierte Übergabe
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        mainAxisSpacing: 0,
        crossAxisSpacing: 0,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (context, index) {
        int day = index + 1;

        return GestureDetector(
          onTap: () {
            dayCallback(day);
          },
          child: AspectRatio(
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
                  day.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: actualFontSize.toDouble(),
                    color: const Color.fromARGB(187, 233, 220, 220),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    ),
  );
}
