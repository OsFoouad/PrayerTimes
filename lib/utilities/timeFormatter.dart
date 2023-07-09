// ignore_for_file: file_names

import 'package:intl/intl.dart' as intl;

String formatTime(String time) {
  DateTime timeDT = intl.DateFormat('HH:mm').parse(time);
  return intl.DateFormat('hh:mm').format(timeDT);
}
