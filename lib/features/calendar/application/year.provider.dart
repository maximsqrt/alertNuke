import 'package:flutter/material.dart';
class YearProvider extends ChangeNotifier {
    int _year = DateTime.now().year;

    int get year => _year;


    void changeYear(int newYear){
        _year += newYear;
        notifyListeners();
    }
}