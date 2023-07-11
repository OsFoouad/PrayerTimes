// ignore_for_file: file_names, prefer_const_constructors, unused_local_variable, avoid_print
import 'package:intl/intl.dart' as intl;
import 'package:flutter/material.dart';
import 'package:prayers_times/utilities/consts.dart';
import '../model/PrayTimes/prayTimeModel.dart';

Widget getNextPray(BuildContext context, PrayerData prayerTime, ftColor) {
  DateTime now = DateTime.now();
  int day = now.day;

  intl.DateFormat originalFormat = intl.DateFormat('dd-MM-yyyy');
  intl.DateFormat reversedFormat = intl.DateFormat('yyyy-MM-dd');

  int nextPrayIndex = 0;

  List<String> pTimes = [
    prayerTime.timings.fajr.split(' ')[0],
    prayerTime.timings.sunrise.split(' ')[0],
    prayerTime.timings.dhuhr.split(' ')[0],
    prayerTime.timings.asr.split(' ')[0],
    prayerTime.timings.maghrib.split(' ')[0],
    prayerTime.timings.isha.split(' ')[0]
  ];
  // print("ptimes is : $pTimes");

  List<DateTime> timesInDateTimesForm = [];
  for (int i = 0; i < pTimes.length; i++) {
    DateTime dateTime = originalFormat.parse(prayerTime.date.gregorian.date);
    String reversedDate = reversedFormat.format(dateTime);
    timesInDateTimesForm
        .add(DateTime.parse("$reversedDate ${pTimes[i]}:00.000"));
  }
  // print("== times in datetime form : $timesInDateTimesForm");

//detect which upcomeing pray time
  for (int i = 0; i < timesInDateTimesForm.length; i++) {
    if (now.isBefore(timesInDateTimesForm[i])) {
      nextPrayIndex = i;
      break;
    } else {}
  }

//handle the next praytime time format
  //hh:mm string
  String nextPray = pTimes[nextPrayIndex];
  // prepare today date as yyyy-mm-dd
  DateTime dT = originalFormat.parse(prayerTime.date.gregorian.date);
  String revDate = reversedFormat.format(dT);
// parse full next pray time
  DateTime nextPrayDT = intl.DateFormat('yyyy-MM-dd HH:mm:ss.SSS')
      .parse("$revDate $nextPray:00.000");

// get the rest of time untill this pray
  Duration timeUntillNextPray = nextPrayDT.difference(now);
  String timeUntill =
      "${timeUntillNextPray.inHours}:${timeUntillNextPray.inMinutes.remainder(60)}";

  // print("==date : ${prayerTime.date.gregorian.date}");
  // print("==nextPrayIndex : $nextPrayIndex");
  // print("==prayName : ${prayerNames[nextPrayIndex]}");

  // ناخد بالنا اي اللي هيحصل بعد العشا

// the ui of this part
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 30.0),
    child: Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Theme.of(context).colorScheme.secondary,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        child: Text("صلاة ${prayerNames[nextPrayIndex]} بعد $timeUntill",
            style: displayTxtStyle(fColor: ftColor)),
      ),
    ),
  );
}
