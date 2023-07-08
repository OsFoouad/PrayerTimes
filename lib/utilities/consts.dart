// ignore_for_file: prefer_const_constructors, 

import 'package:flutter/material.dart';
import 'package:prayers_times/utilities/getCurrent.dart';

int month = getCurrentMonth();
int year = getCurrentYear();
String baseUrl = 'http://api.aladhan.com/v1/calendar/$year/$month?latitude=30.033333&longitude=31.233334&method=2';

Color arrowsColor = Color.fromARGB(199, 255, 2, 120);


displayTxtStyle ({ double fSize = 20 , fColor = const Color.fromARGB(255, 55, 0, 255) ,fWeight = FontWeight.w600 } ) {
  return TextStyle(
    fontSize: fSize , 
    fontWeight: fWeight,
    color: fColor
  );
}