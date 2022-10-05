import 'package:intl/intl.dart';

DateTime parseDate(String date) {
  return DateFormat("yyyy-MM-ddTHH:mm:ssZ").parseUTC(date).toLocal();
}
