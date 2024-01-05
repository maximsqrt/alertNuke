import 'package:alertnukeapp/screens/calender/day/day.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DayColumn extends StatelessWidget {
  final ScrollController dayController;

  DayColumn({required this.dayController});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 6,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            '${DateFormat('E dd/MM/yy').format(DateTime.now())}',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: DayContainer(dayController: dayController),
          ),
        ],
      ),
    );
  }
}