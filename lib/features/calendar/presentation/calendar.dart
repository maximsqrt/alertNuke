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

  int selectedMonthIndex = 0;

  int selectedDayIndex = 0;

  CalendarStatus status = CalendarStatus.year;

@override
Widget build(BuildContext context) {
  ScrollController _scrollController = ScrollController();
  if (status == CalendarStatus.year) {
    return YearCalendar(changeMonthStatus: changeMonthStatus, changeDayStatus: changeDayStatus);
  } else if (status == CalendarStatus.month) {
    return MonthCalendar(monthIndex: selectedMonthIndex, dayCallback: (day) => changeDayStatus(day));
  } else {
    return DayCalendar(selectedDay: selectedDayIndex, monthNumber: selectedMonthIndex);
  }
}

}
