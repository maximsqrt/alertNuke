import 'package:flutter/material.dart';
import 'package:alertnukeapp/screens/wrapper.dart';

class WeekCalendar extends StatelessWidget {
  WeekCalendar({Key? key});

  int daysInMonth(int month) {
    var now = DateTime.now();
    var firstDayThisMonth = DateTime(now.year, month, 1);
    var firstDayNextMonth = DateTime(now.year, month + 1, 1);
    return firstDayNextMonth.difference(firstDayThisMonth).inDays;
  }

  final List<String> weekNames = [
    'Time',
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
    'Sun',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
              const Image(
                image: AssetImage("assets/logo.png"),
                width: 100,
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: GridView.builder(
                  
                  itemCount: 8,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 8,
                    childAspectRatio: .02,
                    crossAxisSpacing: 3,
                  ),
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      // Display time slots beneath "Time" title
                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            weekNames[index],
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
                                color: Color.fromARGB(
                                    114, 171, 205, 239), // Your desired color
                                borderRadius: BorderRadius.circular(3.0),
                              ),
                              child: ListView.builder( physics: NeverScrollableScrollPhysics(),
                                itemCount:
                                    48, // 24 Stunden * 2 Schritte pro Stunde
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
                      );
                    } else {
                      // Other grids
                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            weekNames[index],
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
                            ),
                          ),
                        ],
                      );
                    }
                  },
                ),
              ),
              // Assuming LogoBottomNavigationBar is a valid widget
              const LogoBottomNavigationBar(),
            ],
          ),
        ),
      ),
    );
  }
}
