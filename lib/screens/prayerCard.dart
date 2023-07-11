// ignore_for_file: file_names, prefer_const_constructors, avoid_print, unused_local_variable, non_constant_identifier_names, unused_import

import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:prayers_times/utilities/timeFormatter.dart';
import '../utilities/consts.dart';
import '../model/PrayTimes/prayTimeModel.dart';

Widget buildDayTimeCard(
    BuildContext context, PrayerData prayerTime, Color ftColor) {
  List<String> pTimes = [
    prayerTime.timings.fajr.split(' ')[0],
    prayerTime.timings.sunrise.split(' ')[0],
    prayerTime.timings.dhuhr.split(' ')[0],
    prayerTime.timings.asr.split(' ')[0],
    prayerTime.timings.maghrib.split(' ')[0],
    prayerTime.timings.isha.split(' ')[0]
  ];

  List<dynamic> formattedTimes = [];
  for (int i = 0; i < pTimes.length; i++) {
    formattedTimes.add(formatTime(pTimes[i]));
  }

  return Padding(
    padding: const EdgeInsets.only(bottom: 30, left: 30.0, right: 30.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 5),
        TweenAnimationBuilder(
          tween: Tween(begin: 1.0, end: 0.0),
          duration: Duration(milliseconds: 2000),
          curve: Curves.bounceInOut,
          builder: (context, double value, child) {
            return Transform.translate(
              offset: Offset(value * 200, 0.0),
              child: child!,
            );
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(30),
                bottomLeft: Radius.circular(30),
              ),
              shape: BoxShape.rectangle,
              color: Theme.of(context).colorScheme.secondary,
            ),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(prayerNames[0],
                          style: displayTxtStyle(fColor: ftColor)),
                      SizedBox(width: 10),
                      Text(formattedTimes[0],
                          style: displayTxtStyle(fColor: ftColor)),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(prayerNames[1],
                          style: displayTxtStyle(fColor: ftColor)),
                      SizedBox(width: 10),
                      Text(formattedTimes[1],
                          style: displayTxtStyle(fColor: ftColor)),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(prayerNames[2],
                          style: displayTxtStyle(fColor: ftColor)),
                      SizedBox(width: 10),
                      Text(formattedTimes[2],
                          style: displayTxtStyle(fColor: ftColor)),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(prayerNames[3],
                          style: displayTxtStyle(fColor: ftColor)),
                      SizedBox(width: 10),
                      Text(formattedTimes[3],
                          style: displayTxtStyle(fColor: ftColor)),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(prayerNames[4],
                          style: displayTxtStyle(fColor: ftColor)),
                      SizedBox(width: 10),
                      Text(formattedTimes[4],
                          style: displayTxtStyle(fColor: ftColor)),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(prayerNames[5],
                          style: displayTxtStyle(fColor: ftColor)),
                      SizedBox(width: 10),
                      Text(formattedTimes[5],
                          style: displayTxtStyle(fColor: ftColor)),
                    ],
                  ),
                  SizedBox(height: 15),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
