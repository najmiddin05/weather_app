class DailyUnits {
  final String time;
  final String temperatureMax;
  final String weatherCode;
  final String windSpeedMax;

  DailyUnits({
    required this.time,
    required this.temperatureMax,
    required this.weatherCode,
    required this.windSpeedMax,
  });

  factory DailyUnits.fromJson(Map<String, dynamic> json) {
    return DailyUnits(
      time: json['time'] as String,
      temperatureMax: json['temperature_2m_max'] as String,
      weatherCode: json['weather_code'] as String,
      windSpeedMax: json['wind_speed_10m_max'] as String,
    );
  }
}
