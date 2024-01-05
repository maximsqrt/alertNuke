import 'package:alertnukeapp/screens/calender/widgets/buildmonth.dart';
import 'package:alertnukeapp/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:alertnukeapp/screens/views/timecolumn.dart';

class MonthCalendar extends StatefulWidget {
  final int selectedMonth;

  MonthCalendar({Key? key, required this.selectedMonth}) : super(key: key);

  @override
  _MonthCalendarState createState() => _MonthCalendarState();
}

class _MonthCalendarState extends State<MonthCalendar> {
  late PageController _pageController;
  late TextEditingController _timeController;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.selectedMonth - 1);
    _timeController = TextEditingController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScrollController _scrollController = ScrollController();

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: JPfancyColor.jpFancyColor(),
              borderRadius: BorderRadius.circular(3.0),
            ),
            padding:
                const EdgeInsets.only(top: 100, left: 10, right: 10, bottom: 0),
            child: Column(
              children: [
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

                      return buildMonthPage(20, 0.5, 20);
                    },
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  DateFormat('MMMM')
                      .format(DateTime.now().add(Duration(days: 1))),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: TimeColumn(
              timeController: _scrollController,
              now: DateTime.now(),
            ),
          ),
        ],
      ),
    );
  }
}
