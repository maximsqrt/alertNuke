// ignore_for_file: library_private_types_in_public_api


import 'package:alertnukeapp/config/colors.dart';
import 'package:alertnukeapp/features/calendar/presentation/day/timecontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:intl/intl.dart';

class DayCalendar extends StatefulWidget {
  final int selectedDay;
  final int monthNumber;

  const DayCalendar({Key? key, required this.selectedDay, required this.monthNumber}) : super(key: key);

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
    currentDate = DateTime(currentDate.year, widget.monthNumber, widget.selectedDay);
    super.initState();
    weekNames = ['Time', widget.selectedDay.toString()];
  }

@override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: BackgroundColor.primaryColor,
    appBar: AppBar(
      title: Text(
        '${DateFormat('EEEE').format(currentDate)}, ${currentDate.day.toString()} ${DateFormat('MMMM y').format(currentDate)}',
        style: const TextStyle(fontSize: 18),
      ),
    ),
    body: Padding(
      padding: const EdgeInsets.only(top: 50, left: 10, right: 10, bottom: 0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
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
              child: StaggeredGrid.count(
                crossAxisCount: 6,
                mainAxisSpacing: 1,
                crossAxisSpacing: 1,
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
          ],
        ),
      ),
    ),
  );
}


}

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
