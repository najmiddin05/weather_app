// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'weather_bloc.dart';

class WeatherState extends Equatable {
  final WeatherStatus status;
  final WeatherData? data;
  final String? errorMessage;
  final String? country;
  final String? image;

  const WeatherState({this.status = WeatherStatus.initial, this.data, this.errorMessage, this.country, this.image});

  @override
  List<Object?> get props => [status, data, image, country];

  WeatherState copyWith({
    WeatherStatus? status,
    WeatherData? data,
    String? errorMessage,
    String? country,
    String? image,
  }) {
    return WeatherState(
      status: status ?? this.status,
      data: data ?? this.data,
      errorMessage: errorMessage ?? this.errorMessage,
      country: country ?? this.country,
      image: image ?? this.image,
    );
  }

  @override
  bool get stringify => true;
}

enum WeatherStatus { initial, loading, error, success }
