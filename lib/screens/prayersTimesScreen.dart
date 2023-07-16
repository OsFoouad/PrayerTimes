// ignore_for_file: file_names, avoid_print, unused_local_variable, prefer_const_constructors, unused_element, unused_import

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:prayers_times/apiClient/prayTimeApiClient.dart';
import 'package:prayers_times/model/PrayTimes/prayTimeModel.dart';
import 'package:prayers_times/screens/currentCity.dart';
import 'package:prayers_times/screens/getNextPray.dart';
import 'package:prayers_times/screens/prayerCard.dart';
import 'package:prayers_times/theme/darkTheme.dart';
import 'package:prayers_times/theme/lightTheme.dart';
import 'package:prayers_times/utilities/getCurrent.dart';
import 'package:provider/provider.dart';
import '../theme/themeNotifier.dart';
import '../utilities/consts.dart';

class PrayersTimesScreen extends StatefulWidget {
  const PrayersTimesScreen({Key? key}) : super(key: key);

  @override
  State<PrayersTimesScreen> createState() => _PrayersTimesScreenState();
}

class _PrayersTimesScreenState extends State<PrayersTimesScreen> {
  late Future<List<PrayerData>> _prayerTimes;
  int _currentIndex = getCurrentDay() - 1;
  String backgroundImageAsset = "assets/images/background.jpg";
  String masgedImg = "assets/images/masged1.png";
  Color ftColor = Color.fromARGB(255, 5, 9, 235);
  String _cityName = ' ';

  @override
  void initState() {
    super.initState();
    _prayerTimes = _fetchPrayerTimes();
    _fetchLocation();
  }

  Future<void> _fetchLocation() async {
    try {
      GetLocation getLocation = GetLocation();
      String cn = await getLocation.getCurrentLocation();
      setState(() {
        _cityName = cn;
        print(_cityName);
      });
    } catch (e) {
      print(e.toString());
    }
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
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    int day = getCurrentDay();
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(backgroundImageAsset), fit: BoxFit.cover)),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 25),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(alignment: Alignment.topCenter, children: [
                Image.asset(masgedImg),
                Positioned(
                  left: 10,
                  child: IconButton(
                    onPressed: () {
                      // final isLightMode = themeNotifier.getTheme().brightness == Brightness.light;
                      final newTheme = themeNotifier.getTheme().brightness ==
                              Brightness.light
                          ? darkTheme
                          : lightTheme;
                      final newMasged = newTheme == lightTheme
                          ? "assets/images/masged1.png"
                          : "assets/images/Dmasged1.png";
                      final newBackground = newTheme == lightTheme
                          ? "assets/images/background.jpg"
                          : "assets/images/Blackbackground.jpg";

                      final newTextColor = newTheme == lightTheme
                          ? Color.fromARGB(255, 5, 9, 235)
                          : Colors.yellow;

                      setState(() {
                        backgroundImageAsset = newBackground;
                        masgedImg = newMasged;
                        ftColor = newTextColor;
                      });
                      themeNotifier.setTheme(
                          newTheme, newBackground, newMasged);
                    },
                    icon: Image.asset(
                      themeNotifier.getTheme() == lightTheme
                          ? "assets/images/darkMode.png"
                          : "assets/images/lightMode.png",
                      height: 30,
                      width: 30,
                    ),
                  ),
                ),
              ]),
              const SizedBox(
                height: 20,
              ),
              Text(
                _cityName,
                style: displayTxtStyle(fColor: ftColor),
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
                                  color:
                                      Theme.of(context).colorScheme.secondary,
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
                                            fColor: Theme.of(context)
                                                .colorScheme
                                                .primary,
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
                                            fColor: Theme.of(context)
                                                .colorScheme
                                                .primary,
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
                          SizedBox(
                            height: 10,
                          ),
                          getNextPray(context, prayerTimes[day - 1], ftColor),
                          SizedBox(
                            height: 10,
                          ),
                          buildDayTimeCard(
                              context, prayerTimes[_currentIndex], ftColor),
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
