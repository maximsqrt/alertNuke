import 'package:flutter/material.dart';

class CalendarStateProvider extends ChangeNotifier {

  CalendarStatus status = CalendarStatus.year;
  
  

}

enum CalendarStatus { year, month, day }