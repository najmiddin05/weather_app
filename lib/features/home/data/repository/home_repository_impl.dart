import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/constants/constants.dart';
import 'package:weather_app/core/either/either.dart';
import 'package:weather_app/core/error/failure.dart';
import 'package:weather_app/core/error/server_error.dart';
import 'package:weather_app/features/home/data/models/weather_data.dart';
import 'package:weather_app/features/home/domain/repository/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final Dio dio;

  HomeRepositoryImpl({required this.dio});

  @override
  Future<Either<Failure, WeatherData>> getAllWeatherData({required String latitude, required String longitude}) async {
    try {
      final Response<dynamic> response = await dio.get("${Constants.baseUrl}${Constants.forecast}", queryParameters: {
        'latitude': latitude,
        'longitude': longitude,
        'current': 'weather_code',
        'daily': 'temperature_2m_max,weather_code,wind_speed_10m_max',
      });
      final Map<String, dynamic> data = response.data;
      return Right<Failure, WeatherData>(
        WeatherData.fromJson(data),
      );
    } on DioException catch (error, stacktrace) {
      log("Exception occurred: $error stacktrace: $stacktrace");
      return Left<Failure, WeatherData>(
        ServerError.withDioError(error: error).failure,
      );
    }
  }
}
