// calendar_utils.dart
DateTime changeDay(DateTime currentDate, int daysToAdd) {
  return currentDate.add(Duration(days: daysToAdd));
}
