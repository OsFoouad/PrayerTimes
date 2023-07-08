// ignore_for_file: prefer_const_constructors, avoid_print, non_constant_identifier_names, unused_import

import 'package:flutter/material.dart';
import 'package:prayers_times/screens/prayersTimesScreen.dart';
import 'package:prayers_times/screens/splashScreen.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: prayersTimesScreen(),
    );
  }
}
