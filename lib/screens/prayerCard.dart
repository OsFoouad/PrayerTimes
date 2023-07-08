// ignore_for_file: prefer_const_constructors, unused_element, file_names, prefer_const_literals_to_create_immutables

import 'package:intl/intl.dart' as intl;
import 'package:flutter/material.dart';
import 'package:prayers_times/utilities/consts.dart';
import '../model/PrayTimes/prayTimeModel.dart';

Widget buildDayTimeCard(BuildContext context ,PrayerData prayerTime , Color ftColor) {
  String fajr = prayerTime.timings.fajr.split(' ')[0];
  DateTime fajrDT = intl.DateFormat('HH:mm').parse(fajr);
  String fajrT = intl.DateFormat('hh:mm').format(fajrDT);

  String doha = prayerTime.timings.sunrise.split(' ')[0];
  DateTime dohaDT = intl.DateFormat('HH:mm').parse(doha);
  String dohaT = intl.DateFormat('hh:mm').format(dohaDT);

  String duhur = prayerTime.timings.dhuhr.split(' ')[0];
  DateTime duhurDT = intl.DateFormat('HH:mm').parse(duhur);
  String duhurT = intl.DateFormat('hh:mm').format(duhurDT);

  String asr = prayerTime.timings.asr.split(' ')[0];
  DateTime asrDT = intl.DateFormat('HH:mm').parse(asr);
  String asrT = intl.DateFormat('hh:mm').format(asrDT);

  String maghrib = prayerTime.timings.maghrib.split(' ')[0];
  DateTime maghribDT = intl.DateFormat('HH:mm').parse(maghrib);
  String maghribT = intl.DateFormat('hh:mm').format(maghribDT);

  String isha = prayerTime.timings.isha.split(' ')[0];
  DateTime ishaDT = intl.DateFormat('HH:mm').parse(isha);
  String ishaT = intl.DateFormat('hh:mm').format(ishaDT);

  return Padding(
    padding: const EdgeInsets.only(bottom: 30, left: 30.0, right: 30.0),
    child: TweenAnimationBuilder(
      tween: Tween(begin: 1.0 , end: 0.0),
      duration: Duration(milliseconds: 2000),
      curve: Curves.bounceInOut,
      builder: (context, double value, child) {
        return Transform.translate(
          offset: Offset(value*200, 0.0),
          child: child!);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(30), bottomLeft: Radius.circular(30)),
          shape: BoxShape.rectangle,
          color: Theme.of(context).colorScheme.secondary,
        ),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("الفجر", style: displayTxtStyle( fColor: ftColor , )),
                  SizedBox(
                    width: 10,
                  ),
                  Text(fajrT, style: displayTxtStyle(fColor: ftColor))
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("الضحي", style: displayTxtStyle(fColor: ftColor)),
                  SizedBox(
                    width: 10,
                  ),
                  Text(dohaT, style: displayTxtStyle(fColor: ftColor))
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("الظهر", style: displayTxtStyle(fColor: ftColor)),
                  SizedBox(
                    width: 10,
                  ),
                  Text(duhurT, style: displayTxtStyle(fColor: ftColor))
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("العصر", style: displayTxtStyle(fColor: ftColor)),
                  SizedBox(
                    width: 10,
                  ),
                  Text(asrT, style: displayTxtStyle(fColor: ftColor))
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("المغرب", style: displayTxtStyle(fColor: ftColor)),
                  SizedBox(
                    width: 10,
                  ),
                  Text(maghribT, style: displayTxtStyle(fColor: ftColor))
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("العشاء", style: displayTxtStyle(fColor: ftColor)),
                  SizedBox(
                    width: 10,
                  ),
                  Text(ishaT, style: displayTxtStyle(fColor: ftColor))
                ],
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
