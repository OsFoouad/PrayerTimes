// ignore_for_file: file_names, avoid_print, unused_import

import 'package:dio/dio.dart';
import 'package:prayers_times/utilities/consts.dart';
import 'package:prayers_times/model/PrayTimes/prayTimeModel.dart';

class ApiConnection {
  final Dio _dio = Dio();

  Future <PrayerTimings> getAllPrayTimes() async {
    Response response = await _dio.get(baseUrl);
     final jsonData = response.data;
   return PrayerTimings.fromJson(jsonData);
  }
}
