import 'package:alertnukeapp/screens/calender/day/day.dart';
import 'package:alertnukeapp/screens/calender/month/month.dart';
import 'package:alertnukeapp/screens/calender/widgets/buildyear.dart';
import 'package:alertnukeapp/screens/views/actualdate.dart';
import 'package:alertnukeapp/screens/views/logo.dart';
import 'package:alertnukeapp/themes/colors.dart';
import 'package:alertnukeapp/themes/colors.dart';
import 'package:alertnukeapp/themes/matrixbackground.dart';
import 'package:flutter/material.dart';

enum YearStatus { year, month, day }

class YearCalendar extends StatefulWidget {
  const YearCalendar({Key? key}) : super(key: key);

  @override
  _YearCalendar createState() => _YearCalendar();
}

class _YearCalendar extends State<YearCalendar> {
  void changeMonthStatus(int newMonthIndex) {
    setState(() {
      selectedMonthIndex = newMonthIndex;
      status = YearStatus.month;
    });
  }

  void changeDayStatus(int newDayIndex) {
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
  ScrollController _scrollController = ScrollController();
  if (status == YearStatus.year) {
    return Scaffold( 
      appBar: LottieAppBar(
        backgroundColor: Colors.black,
        title: ActualDate(timeController: _scrollController, now: DateTime.now()),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF6CA7BE), Color(0xFF2E0B4B)],
            tileMode: TileMode.repeated,
            stops: [0.1, 0.9],
            transform: GradientRotation(45 * 3.1415926535897932 / 120),
          ),
        ),
        child: Column(
          children: [
            Image.asset(
              'assets/logo.png',
              width: 110, // specify the width
              height: 110, // specify the height
            ),
            Expanded(
              child: GridView.builder(
                itemCount: 12,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                ),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Card(
                        color: Color.fromARGB(114, 0, 0, 0),
                        elevation: 3,
                        child: AspectRatio(
                          aspectRatio: 1.0, // Set the aspect ratio (1.0 for square)
                          child: MonthGridItem(
                            monthIndex: index + 1,
                            showMonth: (newMonthIndex) => changeMonthStatus(newMonthIndex),
                            // Pass necessary callbacks here
                            dayCallback: (day) => changeDayStatus(day),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),  
    );
  } else if (status == YearStatus.month) {
    return MonthCalendar(monthIndex: selectedMonthIndex, dayCallback: (day) => changeDayStatus(day));
  } else {
    return DayCalendar(selectedDay: selectedDayIndex, monthNumber: selectedMonthIndex);
  }
}


}
