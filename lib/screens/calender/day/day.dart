import 'package:alertnukeapp/screens/logo.dart';
import 'package:flutter/material.dart';
import 'package:alertnukeapp/screens/wrapper.dart';
import 'package:intl/intl.dart';

class DayCalendar extends StatefulWidget {
  @override
  _DayCalendarState createState() => _DayCalendarState();
}

class _DayCalendarState extends State<DayCalendar> {
  final ScrollController _timeController = ScrollController();
  final ScrollController _dayController = ScrollController();
  DateTime currentDate = DateTime.now();
  String current = DateTime.now().day.toString();
  late List<String> weekNames;

  @override
  void initState() {
    super.initState();
    weekNames = ['Time',current];
  }
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
        padding: const EdgeInsets.only(top: 50, left: 10, right: 10, bottom: 0),
        child: Column(
          children: [
            
            const SizedBox(height: 10),
            Expanded(
              child: CalendarRow(
                timeController: _timeController,
                dayController: _dayController,
              ),
            ),
            LogoBottomNavigationBar(),
          ],
        ),
      ),
    );
  }
}



class CalendarRow extends StatelessWidget {
  final ScrollController timeController;
  final ScrollController dayController;

  CalendarRow({required this.timeController, required this.dayController});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        TimeColumn(timeController: timeController),
        DayColumn(dayController: dayController),
      ],
    );
  }
}

class TimeColumn extends StatelessWidget {
  final ScrollController timeController;

  TimeColumn({required this.timeController});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Time',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: TimeContainer(timeController: timeController),
          ),
        ],
      ),
    );
  }
}

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

class TimeContainer extends StatelessWidget {
  final ScrollController timeController;

  TimeContainer({required this.timeController});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(114, 171, 205, 239),
        borderRadius: BorderRadius.circular(3.0),
      ),
      child: Align(
        alignment: Alignment.topCenter,
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          controller: timeController,
          itemCount: 24,
          itemBuilder: (context, timeIndex) {
            final totalMinutes = ((timeIndex * 60) + (6 * 60)) % (24 * 60);
            final hour = totalMinutes ~/ 60;
            final minute = totalMinutes % 60;
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 7.0),
              child: Text(
                '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}


class DayContainer extends StatelessWidget {
  final ScrollController dayController;

  DayContainer({required this.dayController});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF568493),
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
