import 'package:intl/intl.dart';

class FormartUtils {
  String formatDateTimeWithTimeZone({
    required int dt,
    // required int timeZone
  }) {
    String formattedDateTime = formatDateTime(dt
        // timeZone
        );
    // String formattedTimeZone = formatTimeZone(timeZone);

    return '$formattedDateTime';
    //  $formattedTimeZone';
  }

  String formatDateTime(int dt
// int timeZoneOffsetSeconds
      ) {
    // Convert Unix timestamp to DateTime
    DateTime utcDateTime =
        DateTime.fromMillisecondsSinceEpoch(dt * 1000, isUtc: false);
    // Calculate the time zone offset as a Duration
    // Duration timeZoneOffset = Duration(seconds: timeZoneOffsetSeconds);
    // Apply the time zone offset to the UTC time
    // DateTime localDateTime = utcDateTime.add(timeZoneOffset);

    var formatter = DateFormat("EEE h:mm a");

    return formatter.format(utcDateTime);
  }

  static String formatTimeZone(int timeZone) {
    // Calculate the hours and minutes from the time zone offset
    int hours = (timeZone ~/ 3600).abs();
    int minutes = ((timeZone % 3600) ~/ 60).abs();

    // Determine the sign for the time zone offset
    String sign = timeZone >= 0 ? '+' : '-';

    // Format the time zone string
    return 'GMT${minutes > 0 ? ':$minutes' : ''}$sign$hours';
  }

  static String formatDate(int dt) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(dt * 1000);
    var formatter = DateFormat("MMMM d");
    return formatter.format(dateTime);
  }

  static String formatDateOfWeek(int dt) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(dt * 1000);
    var formatter = DateFormat('E d');
    return formatter.format(dateTime);
  }
}
