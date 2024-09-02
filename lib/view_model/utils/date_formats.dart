
//Date Format yyyy-mm-dd
String formatDate(String inputDate) {
  DateTime dateTime = DateTime.parse(inputDate);
  String formattedDate =
      "${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}";
  return formattedDate;
}
class CustomDateFormat {
  DateTime parseCustomDate(String dateStr) {
    try {
      List<String> dateTimeParts = dateStr.split(' ');

      if (dateTimeParts.length < 3) {
        throw FormatException("Invalid date format");
      }

      // Handling the date part
      List<String> dateParts = dateTimeParts[0].split('-');
      if (dateParts.length != 3) {
        throw FormatException("Invalid date format");
      }

      int day = int.parse(dateParts[0]); // day
      int year = int.parse(dateParts[2]); // year

      Map<String, int> monthMap = {
        'Jan': 1,
        'Feb': 2,
        'Mar': 3,
        'Apr': 4,
        'May': 5,
        'Jun': 6,
        'Jul': 7,
        'Aug': 8,
        'Sep': 9,
        'Oct': 10,
        'Nov': 11,
        'Dec': 12,
      };

      int month = monthMap[dateParts[1]]!; // month

      // Handling the time part
      List<String> timeParts = dateTimeParts[1].split(':');
      if (timeParts.length != 2) {
        throw FormatException("Invalid time format");
      }

      int hour = int.parse(timeParts[0]);
      int minute = int.parse(timeParts[1]);

      // Handling AM/PM
      String period = dateTimeParts[2];
      if (period == 'PM' && hour != 12) {
        hour += 12;
      } else if (period == 'AM' && hour == 12) {
        hour = 0;
      }

      DateTime dateTime = DateTime(year, month, day, hour, minute);
      return dateTime;
    } catch (e) {
      print('Error parsing custom date: $e');
      throw FormatException("Invalid date format");
    }
  }
}

