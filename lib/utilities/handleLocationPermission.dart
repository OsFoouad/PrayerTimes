// ignore_for_file: avoid_print, file_names

import 'package:geolocator/geolocator.dart';

Future<bool> handlePermission() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    print("Location Disabled");
    return false;
  }
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      print("Denied");
      return false;
    }
    if (permission == LocationPermission.deniedForever) {
      print("Denied for ever");
      return false;
    }
  }
  return true;
}
