import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/constants/image_constants.dart';
import 'package:weather_app/features/home/presentation/bloc/weather_bloc.dart';
import 'package:weather_app/features/home/presentation/pages/home_page.dart';

mixin HomeMixin on State<HomePage> {
  final GlobalKey<ScaffoldState> mainKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    context.read<WeatherBloc>().add(const GetAllWeatherEvent(latitude: '52.52', longitude: '13.41', country: ' Toshkent', image: Images.tele));
  }

  List<String>? convertDatesWithDay(List<String>? dateStrings) {
    return dateStrings?.map((date) {
      DateTime parsedDate = DateTime.parse(date);
      String dayOfWeek = DateFormat('E').format(parsedDate); // Get day of the week (e.g., Thu, Fri)
      String dayOfMonth = parsedDate.day.toString().padLeft(2, '0'); // Get the day of the month
      return "$dayOfWeek $dayOfMonth";
    }).toList();
  }

  List<String>? convertDatesWithMonthAndDay(List<String>? dateStrings) {
    return dateStrings?.map((date) {
      DateTime parsedDate = DateTime.parse(date);
      String month = DateFormat('MMMM').format(parsedDate); // Get full month name
      String dayOfMonth = parsedDate.day.toString().padLeft(2, '0'); // Get the day of the month
      return "$month $dayOfMonth";
    }).toList();
  }

  String handleWeather(int weatherCode) {
    final weather = WeatherCode.fromCode(weatherCode);

    switch (weather) {
      case WeatherCode.clearSky:
        return WeatherCode.clearSky.description; // Clear
      case WeatherCode.mainlyClear:
        return WeatherCode.mainlyClear.description; // Clear
      case WeatherCode.partlyCloudy:
        return WeatherCode.partlyCloudy.description; // Clear
      case WeatherCode.overcast:
        return WeatherCode.overcast.description; // Clear
      case WeatherCode.fog:
        return WeatherCode.fog.description; // Fog
      case WeatherCode.depositingRimeFog:
        return WeatherCode.depositingRimeFog.description; // Fog
      case WeatherCode.lightDrizzle:
        return WeatherCode.lightDrizzle.description; // Drizzle
      case WeatherCode.moderateDrizzle:
        return WeatherCode.moderateDrizzle.description; // Drizzley
      case WeatherCode.denseDrizzle:
        return WeatherCode.denseDrizzle.description; // Drizzle
      case WeatherCode.lightFreezingDrizzle:
        return WeatherCode.lightFreezingDrizzle.description; // Freezing
      case WeatherCode.denseFreezingDrizzle:
        return WeatherCode.denseFreezingDrizzle.description; // Freezing
      case WeatherCode.slightRain:
        return WeatherCode.slightRain.description; // Rain
      case WeatherCode.moderateRain:
        return WeatherCode.moderateRain.description; // Rain
      case WeatherCode.heavyRain:
        return WeatherCode.heavyRain.description; // Rain
      case WeatherCode.lightFreezingRain:
        return WeatherCode.lightFreezingRain.description; // Freezing Rain
      case WeatherCode.heavyFreezingRain:
        return WeatherCode.heavyFreezingRain.description; // Freezing Rain
      case WeatherCode.slightSnowfall:
        return WeatherCode.slightSnowfall.description; // Snow fall
      case WeatherCode.moderateSnowfall:
        return WeatherCode.moderateSnowfall.description; // Snow fall
      case WeatherCode.heavySnowfall:
        return WeatherCode.heavySnowfall.description; // Snow fall
      case WeatherCode.snowGrains:
        return WeatherCode.snowGrains.description; // Snow grains
      case WeatherCode.slightRainShowers:
        return WeatherCode.slightRainShowers.description; // Rain showers
      case WeatherCode.moderateRainShowers:
        return WeatherCode.moderateRainShowers.description; // Rain shower
      case WeatherCode.violentRainShowers:
        return WeatherCode.violentRainShowers.description; // Rain showers
      case WeatherCode.slightSnowShowers:
        return WeatherCode.slightSnowShowers.description; // Snow showers
      case WeatherCode.heavySnowShowers:
        return WeatherCode.heavySnowShowers.description; // Snow showers
      case WeatherCode.slightThunderstorm:
        return WeatherCode.slightThunderstorm.description; // Thunderstorm
      case WeatherCode.thunderstormWithHail:
        return WeatherCode.thunderstormWithHail.description; // Thunderstorm
      case WeatherCode.heavyThunderstormWithHail:
        return WeatherCode.heavyThunderstormWithHail.description; // Thunderstorm
      default:
        return 'Unknown weather code';
    }
  }
}

enum WeatherCode {
  clearSky(0, 'Clear'),
  mainlyClear(1, 'Clear'),
  partlyCloudy(2, 'Clear'),
  overcast(3, 'Clear'),
  fog(45, 'Fog'),
  depositingRimeFog(48, 'Fog'),
  lightDrizzle(51, 'Drizzle'),
  moderateDrizzle(53, 'Drizzley'),
  denseDrizzle(55, 'Drizzle'),
  lightFreezingDrizzle(56, 'Freezing'),
  denseFreezingDrizzle(57, 'Freezing'),
  slightRain(61, 'Rain'),
  moderateRain(63, 'Rain'),
  heavyRain(65, 'Rain'),
  lightFreezingRain(66, 'Freezing Rain'),
  heavyFreezingRain(67, 'Freezing Rain'),
  slightSnowfall(71, 'Snow fall'),
  moderateSnowfall(73, 'Snow fall'),
  heavySnowfall(75, 'Snow fall'),
  snowGrains(77, 'Snow grains'),
  slightRainShowers(80, 'Rain showers'),
  moderateRainShowers(81, 'Rain shower'),
  violentRainShowers(82, 'Rain showers'),
  slightSnowShowers(85, 'Snow showers'),
  heavySnowShowers(86, 'Snow showers'),
  slightThunderstorm(95, 'Thunderstorm'),
  thunderstormWithHail(96, 'Thunderstorm'),
  heavyThunderstormWithHail(99, 'Thunderstorm');

  final int code;
  final String description;

  const WeatherCode(this.code, this.description);

  static WeatherCode? fromCode(int code) {
    return WeatherCode.values.firstWhere(
      (e) => e.code == code,
    );
  }
}
