
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:prayers_times/apiClient/prayTimeApiClient.dart';
import 'package:prayers_times/utilities/getCurrent.dart';
import 'package:prayers_times/model/PrayTimes/prayTimeModel.dart';
import 'package:prayers_times/screens/prayerCard.dart';
import '../utilities/consts.dart';

class PrayersTimesScreen extends StatefulWidget {
  const PrayersTimesScreen({Key? key}) : super(key: key);

  @override
  State<PrayersTimesScreen> createState() => _PrayersTimesScreenState();
}

class _PrayersTimesScreenState extends State<PrayersTimesScreen> {
  late Future<List<PrayerData>> _prayerTimes;
  int _currentIndex = getCurrentDay() - 1;

  @override
  void initState() {
    super.initState();
    _prayerTimes = _fetchPrayerTimes();
  }

  Future<List<PrayerData>> _fetchPrayerTimes() async {
    try {
      final apiConnection = ApiConnection();
      final prayersTimes = await apiConnection.getAllPrayTimes();
      return prayersTimes.data;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/background.jpg"),
                fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(alignment: Alignment.topCenter, children: [
                Image.asset("assets/images/masged1.png"),
                Positioned(
                  left: 10,
                  child: Image.asset(
                    _currentIndex % 2 == 0
                        ? "assets/images/darkMode.png"
                        : "assets/images/lightMode.png",
                    height: 30,
                    width: 30,
                  ),
                ),
              ]),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Welcome ",
                style: displayTxtStyle(),
              ),
              FutureBuilder<List<PrayerData>>(
                  future: _prayerTimes,
                  builder: (c, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return const Center(
                        child: Text(
                          "Here's an error",
                          style: TextStyle(fontSize: 24, color: Colors.red),
                        ),
                      );
                    } else {
                      final prayerTimes = snapshot.data!;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 30, right: 30, top: 30, bottom: 5),
                            child: TweenAnimationBuilder(
                              builder: (context, double value, child) {
                                return Transform.translate(
                                  offset: Offset(value * -200, 0.0),
                                  child: child!,
                                );
                              },
                              tween: Tween(begin: 1.0, end: 0.0),
                              duration: const Duration(milliseconds: 2000),
                              curve: Curves.bounceInOut,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    topRight: Radius.circular(30),
                                  ),
                                  color: timesBackColor,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
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
                                              prayerTimes.length;
                                        });
                                      },
                                    ),
                                    // Day Name and date
                                    Column(
                                      children: [
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          prayerTimes[_currentIndex]
                                              .date
                                              .hijri
                                              .weekday['ar']!,
                                          style: displayTxtStyle(
                                            fSize: 30,
                                            fColor: titlesColor,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          prayerTimes[_currentIndex]
                                              .date
                                              .gregorian
                                              .date,
                                          style: displayTxtStyle(
                                            fSize: 18,
                                            fColor: titlesColor,
                                          ),
                                        ),
                                        const SizedBox(
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
                                              prayerTimes.length;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          buildDayTimeCard(prayerTimes[_currentIndex]),
                        ],
                      );
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
