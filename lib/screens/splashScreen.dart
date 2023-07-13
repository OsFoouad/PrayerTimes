// ignore_for_file: prefer_const_constructors, file_names, unused_import, prefer_const_literals_to_create_immutables
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:prayers_times/screens/prayersTimesScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => PrayersTimesScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 185, 204, 228),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "مواقيت الصلاة",
                  style: TextStyle(
                      color: Color.fromARGB(255, 19, 17, 153),
                      fontSize: 40,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  "Prayer Times",
                  style: TextStyle(
                      color: Color.fromARGB(255, 19, 17, 153),
                      fontSize: 40,
                      fontWeight: FontWeight.w600),
                ),
                Image.asset(
                  "assets/images/mosqueIcon.png",
                  height: MediaQuery.of(context).size.height / 3,
                  width: MediaQuery.of(context).size.width / 2,
                ),
                Text(
                  "Osama Fouad",
                  style: TextStyle(
                      color: Color.fromARGB(255, 3, 58, 104),
                      fontSize: 25,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "http://osfoouad.github.io",
                  style: TextStyle(
                      color: Color.fromARGB(94, 3, 59, 104),
                      fontSize: 13,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        ));
  }
}
