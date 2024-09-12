class Current {
  final String time;
  final int interval;
  final int weatherCode;

  Current({
    required this.time,
    required this.interval,
    required this.weatherCode,
  });

  factory Current.fromJson(Map<String, dynamic> json) {
    return Current(
      time: json['time'] as String,
      interval: json['interval'] as int,
      weatherCode: json['weather_code'] as int,
    );
  }
}
