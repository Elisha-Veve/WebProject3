import 'package:intl/intl.dart';

String utcToLocal(String value, {bool hasTime = true}) {
  try {
    DateTime parsedDate = DateTime.parse(value);

    return hasTime
        ? DateFormat.yMd().add_jms().format(parsedDate)
        : DateFormat.yMd().format(parsedDate);
  } catch (e) {
    return "Invalid Date";
  }
}

DateTime parseDate(String date) {
  return DateFormat("yyyy-MM-ddTHH:mm:ssZ").parseUTC(date).toLocal();
}
