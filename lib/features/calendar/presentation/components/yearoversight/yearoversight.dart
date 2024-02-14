// import 'package:flutter/material.dart';
// import 'package:riverpod/riverpod.dart';
// import 'package:alertnukeapp/features/calendar/presentation/year/year.dart';

// final yearProvider = StateProvider<int>((ref) => DateTime.now().year);

// class YearCalendarPageView extends StatefulWidget {
//   @override
//   _YearCalendarPageViewState createState() => _YearCalendarPageViewState();
// }

// class _YearCalendarPageViewState extends State<YearCalendarPageView> {
//   late PageController _pageController;
//   int _currentYear = DateTime.now().year;

//   @override
//   void initState() {
//     super.initState();
//     _pageController = PageController(initialPage: _currentYear - 2000);

//     // Listen to changes in the yearProvider
//     context.read(yearProvider).addListener(_onYearChange);
//   }

//   @override
//   void dispose() {
//     context.read(yearProvider).removeListener(_onYearChange);
//     super.dispose();
//   }

//   void _onYearChange() {
//     setState(() {
//       _currentYear = context.read(yearProvider).state;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return PageView.builder(
//       controller: _pageController,
//       onPageChanged: (index) {
//         setState(() {
//           _currentYear = index + 2000; // update the year based on the page index
//         });
//       },
//       itemBuilder: (context, index) {
//         final year = index + 2000; // calculate the year for the current page
//         return YearCalendar(
//           year: year,
//           changeDayStatus: (day) {
//             // Handle day status change
//           },
//           changeMonthStatus: (month) {
//             // Handle month status change
//           },
//         );
//       },
//     );
//   }
// }


//JahresübersichtsScreen muss noch implemented werden! 