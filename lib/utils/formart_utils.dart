import 'package:intl/intl.dart';

class FormartUtils {
  String formatDuration(Duration duration) {
    int hours = duration.inHours;
    int minutes = (duration.inMinutes - hours * 60)
        .abs(); // Absolute value to handle negative durations

    String sign = (duration.inMilliseconds >= 0) ? '+' : '';

    if (minutes == 0) {
      return 'GMT$sign$hours';
    } else {
      return 'GMT$sign$hours:${minutes.toString().padLeft(2, '0')}';
    }
  }

  String formatDateTimeWithTimeZone({
    required int dt,
    required String localTime,
  }) {
    // Convert localtime_epoch to DateTime
    DateTime utcTimefromEpoch =
        DateTime.fromMillisecondsSinceEpoch(dt * 1000, isUtc: true);
    DateTime utcTime =
        DateFormat("yyyy-MM-dd HH:mm").parse(utcTimefromEpoch.toString());

    // Convert localtime string to DateTime
    DateTime localtimeFromString =
        DateFormat("yyyy-MM-dd HH:mm").parse(localTime);

    // Calculate the offset in hours
    Duration diff = localtimeFromString.difference(utcTime.toUtc());

    var formatter = DateFormat("EEE h:mm a");
    return '${formatter.format(localtimeFromString)} ${formatDuration(diff)}';
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
