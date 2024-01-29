class dateHelperService {
// Other helper methods/constants
  static int daysInMonth(int month) {
    var now = DateTime.now();
    var firstDayThisMonth = DateTime(now.year, month, 1);
    var firstDayNextMonth = DateTime(now.year, month + 1, 1);
    return firstDayNextMonth.difference(firstDayThisMonth).inDays;
  }

  static final List<String> monthNames = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];
}
