import 'package:alertnukeapp/config/customgradientappbar.dart';
import 'package:alertnukeapp/features/calendar/presentation/components/buildyear.dart';

import 'package:alertnukeapp/screens/views/timecolumn.dart';
import 'package:flutter/material.dart';

class YearCalendar extends StatefulWidget {
  final Function(int) changeMonthStatus;
  final Function(int) changeDayStatus;

  const YearCalendar(
      {Key? key,
      required this.changeDayStatus,
      required this.changeMonthStatus})
      : super(key: key);

  @override
  _YearCalendar createState() => _YearCalendar();
}

class _YearCalendar extends State<YearCalendar> {
  @override
  Widget build(BuildContext context) {
    ScrollController _scrollController = ScrollController();
    return Scaffold(appBar: AppBar(
      leading: Container(
      // Updated arrow icon
         
  ), 
    
    
      
      backgroundColor: Colors.transparent,
    title: Image.asset(
              'assets/AlertNuke.png',
              width: 200, // specify the width
              // specify the height
            ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.centerRight,
              colors:  [Color(0xFF6CA7BE), Color(0xFF2E0B4B)],

            
            
            ),
            ),
          ),
        ),
      body: Column( 
        children: <Widget>[
        
            
          
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFF6CA7BE), Color(0xFF2E0B4B)],
                  tileMode: TileMode.repeated,
                  stops: [0.1, 0.9],
                  transform: GradientRotation(45 * 3.1415926535897932 / 120),
                ),
              ),
              child: Column(
                children: [
                  TimeColumn(
                      timeController: _scrollController, now: DateTime.now()),
                  Flexible(
                    child: GridView.builder(
                      itemCount: 12,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 5,
                        crossAxisSpacing: 5,
                      ),
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Card(
                              color: const Color.fromARGB(114, 0, 0, 0),
                              elevation: 3,
                              child: AspectRatio(
                                aspectRatio: 1.0,
                                child: MonthGridItem(
                                  monthIndex: index + 1,
                                  showMonth: (newMonthIndex) =>
                                      widget.changeMonthStatus(newMonthIndex),
                                  // Pass necessary callbacks here
                                  dayCallback: (day) =>
                                      widget.changeDayStatus(day),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
