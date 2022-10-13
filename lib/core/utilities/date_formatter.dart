import 'package:intl/intl.dart';

class DateFormatter {
  static DateTime? getDateTimeFromString(String inputDate, String format,
      {bool isUTC = true}) {
    DateFormat dateFormat = DateFormat(format);
    try {
      return dateFormat.parse(inputDate, isUTC);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  static String getStringFromDateTime(DateTime dateTime, String format) {
    DateFormat dateFormat = DateFormat(format);
    return dateFormat.format(dateTime);
  }

  static String? getDateTimeFormatted(
      String inputDate, String inputFormat, String outputFormat,
      {bool isUTC = true}) {
    DateTime? dateTime =
        getDateTimeFromString(inputDate, inputFormat, isUTC: isUTC);
    if (dateTime != null) {
      return getStringFromDateTime(dateTime, outputFormat);
    } else {
      return null;
    }
  }
}
