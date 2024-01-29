import 'package:alertnukeapp/screens/calender/day/day.dart';
import 'package:alertnukeapp/screens/calender/year/year.dart';
import 'package:alertnukeapp/themes/colors.dart';
import 'package:flutter/material.dart';


Widget buildMonthPage(int monthIndex, double childAspectRatio, int fontSize) {
  int actualFontSize = fontSize;
  return Container(
    decoration: BoxDecoration(
      gradient: MonthColor.fancyLinearGradient(),
    ),
    child: GridView.builder(
      padding: EdgeInsets.zero,
      itemCount: daysInMonth(monthIndex),
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
            onDayTap(context, monthIndex, day);
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
                    color: Color.fromARGB(187, 233, 220, 220),
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

void onDayTap(BuildContext context, int month, int day) {
  navigateToDayView(context, day);
}

void navigateToDayView(BuildContext context, int day) {
  Navigator.of(context).push(MaterialPageRoute<void>(
    builder: (BuildContext context) {
      return DayCalendar(selectedDay: day);
    },
  ));
  print('Navigation to Day View - $day');
}
