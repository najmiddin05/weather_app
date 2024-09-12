import 'package:weather_app/features/home/data/models/current_units.dart';
import 'package:weather_app/features/home/data/models/daily_units.dart';
import 'package:weather_app/features/home/data/models/daily_weather.dart';
import 'package:weather_app/features/home/data/models/current.dart';

class WeatherData {
  final double latitude;
  final double longitude;
  final double generationTimeMs;
  final int utcOffsetSeconds;
  final String timezone;
  final String timezoneAbbreviation;
  final double elevation;
  final CurrentUnits currentUnits;
  final Current current;
  final DailyUnits dailyUnits;
  final DailyWeather daily;

  WeatherData({
    required this.latitude,
    required this.longitude,
    required this.generationTimeMs,
    required this.utcOffsetSeconds,
    required this.timezone,
    required this.timezoneAbbreviation,
    required this.elevation,
    required this.currentUnits,
    required this.current,
    required this.dailyUnits,
    required this.daily,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      latitude: json['latitude'] as double,
      longitude: json['longitude'] as double,
      generationTimeMs: json['generationtime_ms'] as double,
      utcOffsetSeconds: json['utc_offset_seconds'] as int,
      timezone: json['timezone'] as String,
      timezoneAbbreviation: json['timezone_abbreviation'] as String,
      elevation: json['elevation'] as double,
      currentUnits: CurrentUnits.fromJson(json['current_units'] as Map<String, Object?>),
      current: Current.fromJson(json['current'] as Map<String, Object?>),
      dailyUnits: DailyUnits.fromJson(json['daily_units'] as Map<String, Object?>),
      daily: DailyWeather.fromJson(json['daily'] as Map<String, Object?>),
    );
  }
}
