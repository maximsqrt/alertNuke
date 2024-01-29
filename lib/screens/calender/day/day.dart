// ignore_for_file: library_private_types_in_public_api

import 'package:alertnukeapp/common/datetime.dart';
import 'package:alertnukeapp/screens/calender/day/timecontainer.dart';
import 'package:alertnukeapp/screens/views/timecolumn.dart';
import 'package:alertnukeapp/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class DayCalendar extends StatefulWidget {
  final int? selectedDay;

  const DayCalendar({Key? key, this.selectedDay}) : super(key: key);

  @override
  _DayCalendarState createState() => _DayCalendarState();
}

class _DayCalendarState extends State<DayCalendar> {
  final ScrollController _timeController = ScrollController();
  final ScrollController _dayController = ScrollController();
  DateTime currentDate = DateTime.now();
  late List<String> weekNames;

  @override
  void initState() {
    super.initState();
    weekNames = ['Time', widget.selectedDay?.toString() ?? ''];
  }

 @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text(currentDate.day.toString()),
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
          stops: [0.1, 0.7],
          transform: GradientRotation(45 * 3.1415926535897932 / 180),
        ),
      ),
      padding: const EdgeInsets.only(top: 50, left: 10, right: 10, bottom: 0),
      child: StaggeredGrid.count(
        crossAxisCount: 6,
        mainAxisSpacing: 2,
        crossAxisSpacing: 2,
        children: [
          // Small Time Column
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 16,
            child: TimeContainer(timeController: _timeController),
          ),
          // Large Day Column
          StaggeredGridTile.count(
            crossAxisCellCount: 5,
            mainAxisCellCount: 16,
            child: DayContainer(dayController: _dayController),
          ),
        ],
      ),
    ),
  );
}
}

// class TimeContainer extends StatelessWidget {
//   final ScrollController timeController;

//   TimeContainer({Key? key, required this.timeController}) : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       decoration: BoxDecoration(
// //         color: Color.fromARGB(114, 171, 205, 239),
// //         borderRadius: BorderRadius.circular(3.0),
// //       ),
// //       child: ListView.builder(
// //         physics: const NeverScrollableScrollPhysics(),
// //         controller: timeController,
// //         itemCount: 48,
// //         padding: EdgeInsets.zero,
// //         itemBuilder: (context, timeIndex) {
// //           final totalMinutes = ((timeIndex * 30) + (6 * 60)) % (24 * 60);
// //           final hour = totalMinutes ~/ 60;
// //           final minute = totalMinutes % 60;
// //           return Padding(
// //             padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 7.0),
// //             child: Text(
// //               '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}',
// //               style: const TextStyle(
// //                 color: Colors.white,
// //                 fontSize: 14,
// //               ),
// //             ),
// //           );
// //         },
// //       ),
// //     );
// //   }
// // }

class DayContainer extends StatelessWidget {
  final ScrollController dayController;

  DayContainer({Key? key, required this.dayController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: MonthColor.fancyLinearGradient(),
        borderRadius: BorderRadius.circular(3.0),
      ),
      child: ListView.builder(
        controller: dayController,
        itemCount: 48,
        itemBuilder: (context, dayIndex) {
          return Container(); // Placeholder for your existing code
        },
      ),
    );
  }
}
