part of 'weather_bloc.dart';

sealed class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

class GetAllWeatherEvent extends WeatherEvent {
  final String latitude;
  final String longitude;
  final String image;
  final String country;

  const GetAllWeatherEvent({required this.latitude, required this.longitude, required this.country, required this.image});

  @override
  List<Object> get props => [latitude, longitude, image, country];
}
