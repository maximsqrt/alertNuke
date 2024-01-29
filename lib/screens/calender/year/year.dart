import 'package:alertnukeapp/screens/calender/day/day.dart';
import 'package:alertnukeapp/screens/calender/month/month.dart';
import 'package:alertnukeapp/screens/calender/widgets/buildyear.dart';
import 'package:alertnukeapp/screens/views/logo.dart';
import 'package:flutter/material.dart';


enum YearStatus {year, month, day}

class YearCalendar extends StatefulWidget {
  const YearCalendar({Key? key}) : super(key: key);

  @override
  _YearCalendar createState() => _YearCalendar();
}

class _YearCalendar extends State<YearCalendar> {


  void changeMonthStatus( int newMonthIndex) {
    setState(() {
        selectedMonthIndex = newMonthIndex;
        status = YearStatus.month;
      });
  }

  void changeDayStatus(int newDayIndex){
 setState(() {
        selectedDayIndex = newDayIndex;
        status = YearStatus.day;
      });
  }


  int selectedMonthIndex = 0;

  int selectedDayIndex = 0;

  YearStatus status = YearStatus.year;




  @override
  Widget build(BuildContext context) {
    if (status == YearStatus.year) {
      return Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF6CA7BE), Color(0xFF2E0B4B)],
              tileMode: TileMode.repeated,
              stops: [0.1, 0.7],
              transform: GradientRotation(45 * 3.1415926535897932 / 180),
            ),
          ),
          padding:
              const EdgeInsets.only(top: 100, left: 10, right: 10, bottom: 0),
          child: Column(
            children: [
              LogoImage(),
              Expanded(
                child: GridView.builder(
                  itemCount: 12,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                  ),
                  itemBuilder: (context, index) {
                    return MonthGridItem(monthIndex: index + 1, showMonth: (newMonthIndex) => changeMonthStatus(newMonthIndex), dayCallback: (day) => changeDayStatus(day),);
                  },
                ),
              ),
            ],
          ),
        ),
      );
    } else if (status == YearStatus.month) {
      return MonthCalendar(monthIndex: selectedMonthIndex,dayCallback: (day) => changeDayStatus(day));
    } else {
      return DayCalendar(selectedDay: selectedDayIndex,monthNumber: selectedMonthIndex);
    }
  }
}