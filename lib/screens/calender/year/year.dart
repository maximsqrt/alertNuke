// ignore_for_file: prefer_const_constructors

import 'package:alertnukeapp/screens/calender/widgets/buildmonth.dart';
import 'package:alertnukeapp/screens/views/logo.dart';
import 'package:flutter/material.dart';
import 'package:alertnukeapp/screens/calender/month/month.dart';
import 'package:alertnukeapp/screens/wrapper.dart';


class YearCalendar extends StatelessWidget {
const YearCalendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        padding: const EdgeInsets.only(top: 100, left: 10, right: 10, bottom: 0),
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
                  return MonthGridItem(monthIndex: index + 1);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class MonthGridItem extends StatelessWidget {
  final int monthIndex;

  const MonthGridItem({Key? key, required this.monthIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => navigateToMonthView(context, monthIndex),
      child: Container(
        // Adjust padding as needed
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              monthNames[monthIndex - 1],
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Container(
                child: buildMonthPage(monthIndex, 1, 10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



void navigateToMonthView(BuildContext context, int month) {
  Navigator.of(context).push(MaterialPageRoute<void>(
    builder: (BuildContext context) {
      return MonthCalendar(monthIndex: month);
    },
  ));
  print('Navigating to Month View - $month');
}



int daysInMonth(int month) {
  var now = DateTime.now();
  var firstDayThisMonth = DateTime(now.year, month, 1);
  var firstDayNextMonth = DateTime(now.year, month + 1, 1);
  return firstDayNextMonth.difference(firstDayThisMonth).inDays;
}

final List<String> monthNames = [
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December',
];
