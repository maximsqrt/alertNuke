import 'package:alertnukeapp/features/calendar/presentation/day/day.dart';
import 'package:alertnukeapp/features/calendar/presentation/month/month.dart';
import 'package:alertnukeapp/features/calendar/presentation/year/year.dart';
import 'package:flutter/material.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  _Calendar createState() => _Calendar();
}


enum CalendarStatus { year, month, day }

class _Calendar extends State<Calendar> {
int selectedMonthIndex = 0;
  int selectedYearIndex = DateTime.now().year; // Startjahr setzen, z.B. das aktuelle Jahr
  int selectedDayIndex = 0;
void changeMonthStatus(int newMonthIndex) {
    setState(() {
      selectedMonthIndex = newMonthIndex;
      status = CalendarStatus.month;
    });
  }

  void changeDayStatus(int newDayIndex) {
    setState(() {
      selectedDayIndex = newDayIndex;
      status = CalendarStatus.day;
    });
  }
    void changeYearStatus(int newYearIndex) {
    setState(() {
      selectedYearIndex = newYearIndex;
      status = CalendarStatus.year;
    });
  }


  CalendarStatus status = CalendarStatus.year;

@override
Widget build(BuildContext context) {
  // ignore: unused_local_variable, no_leading_underscores_for_local_identifiers
  ScrollController _scrollController = ScrollController();
 if (status == CalendarStatus.year) {
      return YearCalendar(
        changeMonthStatus: changeMonthStatus,
        changeDayStatus: changeDayStatus,
        selectedYear: selectedYearIndex,
        changeYearStatus: changeYearStatus, // Übergabe der Funktion an YearCalendar
      );
  } else if (status == CalendarStatus.month) {
    return MonthCalendar(monthIndex: selectedMonthIndex, selectedYear: selectedYearIndex, dayCallback: (day) => changeDayStatus(day));
  } else {
    return DayCalendar(selectedDay: selectedDayIndex, monthNumber: selectedMonthIndex);
  }
}

}
