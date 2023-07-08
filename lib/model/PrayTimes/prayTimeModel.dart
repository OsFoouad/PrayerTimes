// ignore_for_file: file_names

class PrayerTimings {
  int code;
  String status;
  List<PrayerData> data;

  PrayerTimings({
    required this.code,
    required this.status,
    required this.data,
  });

  factory PrayerTimings.fromJson(Map<String, dynamic> json) {
    return PrayerTimings(
      code: json['code'],
      status: json['status'],
      data: List<PrayerData>.from(json['data'].map((x) => PrayerData.fromJson(x))),
    );
  }
}



class PrayerData {
  Timings timings;
  Date date;
  Meta meta;

  PrayerData({
    required this.timings,
    required this.date,
    required this.meta,
  });

  factory PrayerData.fromJson(Map<String, dynamic> json) {
    return PrayerData(
      timings: Timings.fromJson(json['timings']),
      date: Date.fromJson(json['date']),
      meta: Meta.fromJson(json['meta']),
    );
  }
}

class Timings {
  String fajr;
  String sunrise;
  String dhuhr;
  String asr;
  String sunset;
  String maghrib;
  String isha;
  String imsak;
  String midnight;
  String firstThird;
  String lastThird;

  Timings({
    required this.fajr,
    required this.sunrise,
    required this.dhuhr,
    required this.asr,
    required this.sunset,
    required this.maghrib,
    required this.isha,
    required this.imsak,
    required this.midnight,
    required this.firstThird,
    required this.lastThird,
  });

  factory Timings.fromJson(Map<String, dynamic> json) {
    return Timings(
      fajr: json['Fajr'],
      sunrise: json['Sunrise'],
      dhuhr: json['Dhuhr'],
      asr: json['Asr'],
      sunset: json['Sunset'],
      maghrib: json['Maghrib'],
      isha: json['Isha'],
      imsak: json['Imsak'],
      midnight: json['Midnight'],
      firstThird: json['Firstthird'],
      lastThird: json['Lastthird'],
    );
  }
}

class Date {
  String readable;
  String timestamp;
  Gregorian gregorian;
  Hijri hijri;

  Date({
    required this.readable,
    required this.timestamp,
    required this.gregorian,
    required this.hijri,
  });

  factory Date.fromJson(Map<String, dynamic> json) {
    return Date(
      readable: json['readable'],
      timestamp: json['timestamp'],
      gregorian: Gregorian.fromJson(json['gregorian']),
      hijri: Hijri.fromJson(json['hijri']),
    );
  }
}

class Gregorian {
  String date;
  String format;
  String day;
  Map<String, String> weekday;
  Map<String, dynamic> month;
  String year;
  Map<String, String> designation;

  Gregorian({
    required this.date,
    required this.format,
    required this.day,
    required this.weekday,
    required this.month,
    required this.year,
    required this.designation,
  });

  factory Gregorian.fromJson(Map<String, dynamic> json) {
    return Gregorian(
      date: json['date'],
      format: json['format'],
      day: json['day'],
      weekday: Map<String, String>.from(json['weekday']),
      month: Map<String, dynamic>.from(json['month']),
      year: json['year'],
      designation: Map<String, String>.from(json['designation']),
    );
  }
}

class Hijri {
  String date;
  String format;
  String day;
  Map<String, String> weekday;
  Map<String, dynamic> month;
  String year;
  Map<String, String> designation;
  List<dynamic> holidays;

  Hijri({
    required this.date,
    required this.format,
    required this.day,
    required this.weekday,
    required this.month,
    required this.year,
    required this.designation,
    required this.holidays,
  });

  factory Hijri.fromJson(Map<String, dynamic> json) {
    return Hijri(
      date: json['date'],
      format: json['format'],
      day: json['day'],
      weekday: Map<String, String>.from(json['weekday']),
      month: Map<String, dynamic>.from(json['month']),
      year: json['year'],
      designation: Map<String, String>.from(json['designation']),
      holidays: List<dynamic>.from(json['holidays']),
    );
  }
}

class Meta {
  double latitude;
  double longitude;
  String timezone;
  Method method;
  String latitudeAdjustmentMethod;
  String midnightMode;
  String school;
  Map<String, int> offset;

  Meta({
    required this.latitude,
    required this.longitude,
    required this.timezone,
    required this.method,
    required this.latitudeAdjustmentMethod,
    required this.midnightMode,
    required this.school,
    required this.offset,
  });

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      latitude: json['latitude'],
      longitude: json['longitude'],
      timezone: json['timezone'],
      method: Method.fromJson(json['method']),
      latitudeAdjustmentMethod: json['latitudeAdjustmentMethod'],
      midnightMode: json['midnightMode'],
      school: json['school'],
      offset: Map<String, int>.from(json['offset']),
    );
  }
}

class Method {
  int id;
  String name;
  Map<String, int> params;
  Location location;

  Method({
    required this.id,
    required this.name,
    required this.params,
    required this.location,
  });

  factory Method.fromJson(Map<String, dynamic> json) {
    return Method(
      id: json['id'],
      name: json['name'],
      params: Map<String, int>.from(json['params']),
      location: Location.fromJson(json['location']),
    );
  }
}

class Location {
  double latitude;
  double longitude;

  Location({
    required this.latitude,
    required this.longitude,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }
}
