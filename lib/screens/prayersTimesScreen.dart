// ignore_for_file: camel_case_types, file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:prayers_times/apiClient/prayTimeApiClient.dart';
import 'package:prayers_times/utilities/getCurrent.dart';
import 'package:prayers_times/model/PrayTimes/prayTimeModel.dart';
import 'package:prayers_times/screens/prayerCard.dart';

import '../utilities/consts.dart';

class prayersTimesScreen extends StatefulWidget {
  const prayersTimesScreen({super.key});

  @override
  State<prayersTimesScreen> createState() => _prayersTimesScreenState();
}

class _prayersTimesScreenState extends State<prayersTimesScreen> {
  List<PrayerData> _prayerTimes = [];
  int _currentIndex = getCurrentDay() - 1;

  @override
  void initState() {
    super.initState();
    _fetchPrayerTimes();
  }

  Future<void> _fetchPrayerTimes() async {
    try {
      final apiConnection = ApiConnection();
      final prayersTimes = await apiConnection.getAllPrayTimes();
      setState(() {
        _prayerTimes = prayersTimes.data;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _prayerTimes.isEmpty
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/background.jpg"),
                        fit: BoxFit.cover)),
                child: Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Image.asset("assets/images/masged1.png"),
                          Positioned(
                            left: 10,
                            child: Image.asset( _currentIndex%2==0 ?
                              "assets/images/darkMode.png" : 
                              "assets/images/lightMode.png" ,
                              height: 30,
                              width: 30,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 30, right: 30, top: 30, bottom: 5),
                        child: TweenAnimationBuilder(
                          builder: (context, double value, child) {
                            return Transform.translate(offset: Offset(value*-200, 0.0),
                            child: child!,
                            );
                          },
                          tween: Tween(begin: 1.0 , end: 0.0),
                          duration: Duration(milliseconds: 2000),
                          curve: Curves.bounceInOut,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30)),
                              color: timesBackColor,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                // the previous day arrow
                                IconButton(
                                  icon: Icon(
                                    Icons.arrow_back,
                                    size: 30,
                                    color: arrowsColor,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _currentIndex = (_currentIndex - 1) %
                                          _prayerTimes.length;
                                    });
                                  },
                                ),
                                Column(
                                  children: [
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      _prayerTimes[_currentIndex]
                                          .date
                                          .hijri
                                          .weekday['ar']!,
                                      style: displayTxtStyle(
                                        fSize: 30,
                                        fColor: titlesColor,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      _prayerTimes[_currentIndex]
                                          .date
                                          .gregorian
                                          .date,
                                      style: displayTxtStyle(
                                        fSize: 18,
                                        fColor: titlesColor,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                  ],
                                ),
                        
                                // the Next day arrow
                        
                                IconButton(
                                  icon: Icon(
                                    Icons.arrow_forward,
                                    size: 30,
                                    color: arrowsColor,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _currentIndex = (_currentIndex + 1) %
                                          _prayerTimes.length;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      buildDayTimeCard(_prayerTimes[_currentIndex]),
                      SizedBox(
                        height: 1,
                      ),
                    ],
                  ),
                ),
              ));
  }
}
