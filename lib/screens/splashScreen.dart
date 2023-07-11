// ignore_for_file: prefer_const_constructors, file_names, unused_import
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
              ),
              Text(
                "Prayer Times",
                style: TextStyle(
                    color: Color.fromARGB(255, 104, 32, 3),
                    fontSize: 50,
                    fontWeight: FontWeight.w600),
              ),
              Image.asset(
                "assets/images/mosqueIcon.png",
                height: MediaQuery.of(context).size.height / 2 ,
                width: MediaQuery.of(context).size.width/2 ,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Osama Fouad",
                style: TextStyle(
                    color: Color.fromARGB(255, 3, 58, 104),
                    fontSize: 35,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "http://osfoouad.github.io",
                style: TextStyle(
                    color: Color.fromARGB(96, 3, 59, 104),
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
