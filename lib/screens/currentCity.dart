// ignore_for_file: file_names, avoid_print

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class GetLocation {
  String currentLocation = '';

  Future<String> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      List<Placemark> placemarks = await placemarkFromCoordinates(
          position.latitude, position.longitude,
          localeIdentifier: 'ar');

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        String? city = place.locality;
        currentLocation = city ?? '';
      }
    } catch (e) {
      print(e.toString());
    }
    return currentLocation;
  }
}
