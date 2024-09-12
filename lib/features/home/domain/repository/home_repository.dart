import 'package:weather_app/core/either/either.dart';
import 'package:weather_app/core/error/failure.dart';
import 'package:weather_app/features/home/data/models/weather_data.dart';

abstract class HomeRepository {
  const HomeRepository();

  Future<Either<Failure, WeatherData>> getAllWeatherData({
    required String latitude,
    required String longitude,
  });
}
