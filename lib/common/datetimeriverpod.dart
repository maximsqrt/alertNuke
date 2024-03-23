import 'package:riverpod/riverpod.dart';

final yearProvider = StateNotifierProvider<YearNotifier, int>((ref) => YearNotifier());
final monthProvider = StateNotifierProvider<MonthNotifier, int>((ref) => MonthNotifier());
final dayProvider = StateNotifierProvider<DayNotifier, int>((ref) => DayNotifier());
final hourProvider = StateNotifierProvider<HourNotifier, int>((ref) => HourNotifier());

class YearNotifier extends StateNotifier<int> {
  YearNotifier() : super(DateTime.now().year);
  void setYear(int year) => state = year;
}

class MonthNotifier extends StateNotifier<int> {
  MonthNotifier() : super(DateTime.now().month);
  void setMonth(int month) => state = month;
}

class DayNotifier extends StateNotifier<int> {
  DayNotifier() : super(DateTime.now().day);
  void setDay(int day) => state = day;
}

class HourNotifier extends StateNotifier<int> {
  HourNotifier() : super(DateTime.now().hour);
  void setHour(int hour) => state = hour;
}
