

import 'package:alertnukeapp/application/DateHelperService.dart';
import 'package:alertnukeapp/screens/calender/widgets/buildmonth.dart';
import 'package:flutter/material.dart';


class MonthGridItem extends StatelessWidget {

  final int monthIndex;

  Function(int) showMonth;
  Function(int) dayCallback;
  
 MonthGridItem({required this.monthIndex, required this.showMonth,required this.dayCallback});

  @override
  Widget build(BuildContext context) {
  
    return GestureDetector(
      onTap: () => showMonth(monthIndex),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              dateHelperService.monthNames[monthIndex - 1],
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Container(
                child: buildMonthPage(monthIndex, 1, 10,dayCallback: (day) => dayCallback(day)),
              ),
            ),
          ],
        ),
      ),
    );
  }

}