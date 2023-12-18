import 'package:flutter/material.dart';
import 'package:alertnukeapp/screens/wrapper.dart';

class DayCalendar extends StatefulWidget {
  @override
  _DayCalendarState createState() => _DayCalendarState();
}

class _DayCalendarState extends State<DayCalendar> {
  final ScrollController _timeController = ScrollController();
  final ScrollController _dayController = ScrollController(); 

  final List<String> weekNames = ['Time', 'actual day'];

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
            const Image(
              image: AssetImage("assets/logo.png"),
              width: 100,
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          weekNames[0],
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color.fromARGB(114, 171, 205, 239),
                              borderRadius: BorderRadius.circular(3.0),
                            ),
                            child: ListView.builder( physics: NeverScrollableScrollPhysics(),
                              controller: _timeController,
                              itemCount: 48,
                              itemBuilder: (context, timeIndex) {
                                final totalMinutes =
                                    ((timeIndex * 30) + (6 * 60)) % (24 * 60);
                                final hour = totalMinutes ~/ 60;
                                final minute = totalMinutes % 60;
                                return Padding(
                                  padding: const EdgeInsets.all(4.0),
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
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          weekNames[1],
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFF568493),
                              borderRadius: BorderRadius.circular(3.0),
                            ),
                            child: ListView.builder( 
                              controller: _dayController,
                              itemCount: 48,
                              itemBuilder: (context, dayIndex) {
                                // ... (your existing code)
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            LogoBottomNavigationBar(),
          ],
        ),
      ),
    );
  }
}
