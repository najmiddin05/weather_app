class CurrentUnits {
  final String time;
  final String interval;
  final String weatherCode;

  CurrentUnits({
    required this.time,
    required this.interval,
    required this.weatherCode,
  });

  factory CurrentUnits.fromJson(Map<String, Object?> json) {
    return CurrentUnits(
      time: json['time'] as String,
      interval: json['interval'] as String,
      weatherCode: json['weather_code'] as String,
    );
  }
}
