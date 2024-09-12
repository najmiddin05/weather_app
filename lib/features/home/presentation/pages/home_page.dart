import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather_app/constants/image_constants.dart';
import 'package:weather_app/core/theme/app_icons.dart';
import 'package:weather_app/features/home/presentation/bloc/weather_bloc.dart';
import 'package:weather_app/features/home/presentation/pages/widgets/glass_weather_widget.dart';
import 'package:weather_app/features/home/presentation/pages/widgets/weather_app_drawer.dart';

import 'mixin/home_mixin.dart';
import 'widgets/glassmorphism_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with HomeMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: mainKey,
      endDrawer: const WeatherAppDrawer(),
      body: BlocListener<WeatherBloc, WeatherState>(
        listener: (context, state) {
          if (state.status == WeatherStatus.success) {
            if (mainKey.currentState?.isEndDrawerOpen ?? false) {
              mainKey.currentState!.closeEndDrawer();
            }
          } else if (state.status == WeatherStatus.loading) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Loading weather data..."),
                duration: Duration(milliseconds: 500),
              ),
            );
          } else if (state.status == WeatherStatus.error) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Error loading weather data."),
              ),
            );
          }
        },
        child: Stack(
          children: [
            BlocBuilder<WeatherBloc, WeatherState>(
              builder: (context, state) {
                if (state.status == WeatherStatus.loading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state.status == WeatherStatus.error) {
                  return const Center(child: Text("Error loading weather data"));
                }

                return SizedBox.expand(
                  child: state.image != null
                      ? Image(
                          image: AssetImage(state.image!),
                          fit: BoxFit.cover,
                        )
                      : const Center(
                          child: Text("No image available"),
                        ),
                );
              },
            ),
            BlocBuilder<WeatherBloc, WeatherState>(
              builder: (context, state) {
                // if (state.data == null || state.data!.daily == null) {
                //   return const Center(
                //     child: CircularProgressIndicator(),
                //   );
                // }

                final List<String?>? dates = convertDatesWithDay(state.data?.daily.time);
                final List<String?>? monthDate = convertDatesWithMonthAndDay(state.data?.daily.time);

                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 60, right: 15, left: 30), //AppUtils.kPaddingAll16,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(CupertinoIcons.location_solid, color: Colors.white),
                                Text(
                                  state.country ?? '',
                                  style: const TextStyle(fontSize: 18, color: Colors.white),
                                ),
                              ],
                            ),
                            IconButton(
                              onPressed: () {
                                mainKey.currentState!.openEndDrawer();
                              },
                              icon: const Icon(
                                Icons.menu,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 60),
                        child: Text(
                          monthDate?.first ?? "",
                          style: const TextStyle(fontSize: 40, color: Colors.white, fontWeight: FontWeight.w500),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Image(
                        image: AssetImage(Images.cloud),
                        height: 95,
                      ),
                      Text(
                        handleWeather(state.data?.daily.weatherCode.first ?? 0),
                        style: const TextStyle(fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      Stack(
                        alignment: Alignment.topRight,
                        children: [
                          Text(
                            '${state.data?.daily.temperature2mMax.first}',
                            style: const TextStyle(fontSize: 86, color: Colors.white, fontWeight: FontWeight.w500),
                          ),
                          Transform.translate(
                            offset: const Offset(20, 10),
                            child: const Text(
                              '°C',
                              style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                AppIcons.wind.copyWith(height: 40),
                                const Text(
                                  'WIND',
                                  style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  '${state.data?.daily.windSpeed10mMax.first}',
                                  style: const TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                AppIcons.feels.copyWith(height: 40),
                                const Text(
                                  'FEELS LIKE',
                                  style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  '${state.data?.daily.temperature2mMax.first}',
                                  style: const TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                AppIcons.humidity.copyWith(height: 40),
                                const Text(
                                  'HUMIDITY',
                                  style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w500),
                                ),
                                const Text(
                                  '56%',
                                  style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: GlassmorphismContainer(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                for (int i = 0; i < 4; i++)
                                  GlassWeatherWidget(
                                    date: '${dates?[i]}',
                                    celsius: '${state.data?.daily.temperature2mMax[i]}',
                                    number: '${state.data?.daily.windSpeed10mMax[i]}',
                                    appIcons: AppIcons.sunUnder1.copyWith(height: 50),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
