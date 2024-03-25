import 'package:alertnukeapp/common/datetimecalc.dart';
import 'package:flutter/material.dart';
// Importiere deine DateTimeCalc Klasse

import 'package:alertnukeapp/config/colors.dart';

import '../../application/year.provider.dart';

Widget buildMonthPage(int monthIndex, YearProvider yearProvider,  double childAspectRatio, int fontSize, {required Function(int) dayCallback}) {
  int actualFontSize = fontSize;


  // Anpassung hier: Monatsindex + 1, um von 0-basierter zu 1-basierter Indexierung zu wechseln
  int correctedMonthIndex = monthIndex + 1;
 
  
  
  // Erstelle eine Instanz von DateTimeCalc mit dem gegebenen Jahr
  DateTimeCalc dateTimeCalc = DateTimeCalc(yearProvider.year);

  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(3),
      gradient: MonthColor.fancyLinearGradient(),
    ),
    child: GridView.builder(
      padding: EdgeInsets.zero,
      // Verwende dateTimeCalc, um die Anzahl der Tage im Monat zu erhalten
      itemCount: dateTimeCalc.daysInMonth(correctedMonthIndex),
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
                  width: 0.30,
                  color: const Color.fromARGB(117, 127, 76, 229),
                ),
                borderRadius: BorderRadius.circular(9.0),
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
