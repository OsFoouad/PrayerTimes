// ignore_for_file: non_constant_identifier_names, file_names
int getCurrentDay() {
  DateTime now = DateTime.now();
  return now.day;
}

int getCurrentMonth() {
  DateTime now = DateTime.now();
  return now.month;
}

int getCurrentYear() {
  DateTime now = DateTime.now();
  return now.year;
}

String getCurrentHourMinute() {
  DateTime now = DateTime.now();
  String currentTime =
      '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}';
  return currentTime;
}

