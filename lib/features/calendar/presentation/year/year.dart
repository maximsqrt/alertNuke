import 'package:alertnukeapp/features/calendar/application/year.provider.dart';
import 'package:alertnukeapp/features/calendar/presentation/components/buildyear.dart';
import 'package:alertnukeapp/screens/views/timecolumn.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unicons/unicons.dart';

class YearCalendar extends StatefulWidget {
  final Function(int) changeMonthStatus;
  final Function(int) changeDayStatus;
  final int selectedYear;

  const YearCalendar(
      {Key? key,
      required this.changeDayStatus,
      required this.changeMonthStatus,
      required this.selectedYear,
      required void Function(int newYearIndex) changeYearStatus})
      : super(key: key);

  @override
  _YearCalendar createState() => _YearCalendar();
}

class _YearCalendar extends State<YearCalendar> {


  Key key = UniqueKey();
  void _updateYear(int yearToAdd) {
    Provider.of<YearProvider>(context,listen:false).changeYear(yearToAdd);
  }

  @override
  Widget build(BuildContext context) {
    ScrollController _scrollController = ScrollController();
    final yearProvider = Provider.of<YearProvider>(context);
    return Scaffold( 
      appBar:
AppBar(
  title: Text(yearProvider.year.toString()),
  leading: IconButton(
    icon:  Icon(UniconsLine.arrow_down),
    onPressed: () => _updateYear(-1), // Jahr verringern
  ),
  backgroundColor: Colors.transparent,
  actions: <Widget>[
    IconButton(
      icon:  Icon(UniconsLine.arrow_up),
      onPressed: () => _updateYear(1), // Jahr erhöhen
    ),
  ],
   flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.centerRight,
              colors: [Color(0xFF6CA7BE), Color(0xFF2E0B4B)],
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
                      key: PageStorageKey('MonthGridView-${yearProvider.year  }'),
                      itemCount: 12,
                      gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 5,
                        crossAxisSpacing: 5,
                      ),
                      itemBuilder: (context, index) {
                        print("Übergebenes Jahr an MonthGridItem: ${yearProvider.year }");

                        return 
                        
                         
                        
                           Column(
                                          children: [
                            Card(
                              color: const Color.fromARGB(114, 0, 0, 0),
                              elevation: 3,
                              child: AspectRatio(
                                aspectRatio: 1.0,
                                child: MonthGridItem(
                                  monthIndex: index,
                                  yearProvider: yearProvider,
                                  showMonth: (newMonthIndex) => widget
                                      .changeMonthStatus(newMonthIndex - 2),
                                  // Pass necessary callbacks here
                                  dayCallback: (day) =>
                                     (){},
                                ),
                              ),
                            ),
                          ],);
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
