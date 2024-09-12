class DailyWeather {
  final List<String> time;
  final List<double> temperature2mMax;
  final List<int> weatherCode;
  final List<double> windSpeed10mMax;

  DailyWeather({
    required this.time,
    required this.temperature2mMax,
    required this.weatherCode,
    required this.windSpeed10mMax,
  });

  factory DailyWeather.fromJson(Map<String, Object?> json) {
    return DailyWeather(
      time: List<String>.from(json['time'] as List),
      temperature2mMax: List<double>.from(json['temperature_2m_max'] as List),
      weatherCode: List<int>.from(json['weather_code'] as List),
      windSpeed10mMax: List<double>.from(json['wind_speed_10m_max'] as List),
    );
  }
}
