import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:alertnukeapp/screens/wrapper.dart';

class MonthCalendar extends StatefulWidget {
  final int selectedMonth;

  MonthCalendar({Key? key, required this.selectedMonth}) : super(key: key);

  @override
  _MonthCalendarState createState() => _MonthCalendarState();
}

class _MonthCalendarState extends State<MonthCalendar> {
  late PageController _pageController;
  DateTime now = DateTime.now();
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.selectedMonth - 1);
  }

  @override
  Widget build(BuildContext context) {
    double aspectRatio = 1.0;
        MediaQuery.of(context).size.width / 7 / 60; // Adjust as needed

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
            stops: [0.2, 0.7],
            transform: GradientRotation(45 * 3.1415926535897932 / 180),
          ),
        ),
        padding: const EdgeInsets.only(top: 100, left: 10, right: 10, bottom: 0),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Text(
              DateFormat('MMMM').format(DateTime(now.year, now.month, 1)),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Text(
              DateFormat('dd / MM / yy').format(now),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Text(
              DateFormat('EEEE').format(now),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (int page) {
                  setState(() {
                    currentPage = page;
                  });
                },
                itemCount: 12, // Number of months
                itemBuilder: (BuildContext context, int index) {
                  // Calculate the month for the current page
                  int month = index + 1;

                  return buildMonthPage(month);
                },
              ),
            ),
            const SizedBox(height: 10),
            Text(
              DateFormat('MMMM').format(DateTime(now.year, currentPage + 1, 1)),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const LogoBottomNavigationBar(),
          ],
        ),
      ),
    );
  }

  Widget buildMonthPage(int month) {
    return Container(
      child: GridView.builder(
        padding: EdgeInsets.zero,
        itemCount: daysInMonth(month),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 7,
          mainAxisSpacing: 0,
          crossAxisSpacing: 0,
          childAspectRatio: .5,
        ),
        itemBuilder: (context, index) {
          return AspectRatio(
            aspectRatio: 1.0,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 0.80,
                  color: const Color.fromARGB(117, 127, 76, 229),
                ),
                borderRadius: BorderRadius.circular(3.0),
              ),
              child: Center(
                child: Text(
                  (index + 1).toString(),
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(187, 233, 220, 220),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  int daysInMonth(int month) {
    var firstDayThisMonth = DateTime(now.year, month, 1);
    var firstDayNextMonth = DateTime(now.year, month + 1, 1);
    return firstDayNextMonth.difference(firstDayThisMonth).inDays;
  }
}
