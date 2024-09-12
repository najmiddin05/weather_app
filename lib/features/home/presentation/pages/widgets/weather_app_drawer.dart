import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/constants/image_constants.dart';
import 'package:weather_app/core/theme/app_icons.dart';
import 'package:weather_app/core/theme/text_styles.dart';
import 'package:weather_app/features/home/presentation/bloc/weather_bloc.dart';
import 'package:weather_app/features/home/presentation/pages/widgets/glass_container_widget.dart';
import 'package:weather_app/features/home/presentation/pages/widgets/gradient_background.dart';

class WeatherAppDrawer extends StatelessWidget {
  const WeatherAppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: GradientBackground(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60, right: 15, left: 30), //AppUtils.kPaddingAll16,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'Saved Locations',
                        style: TextStyles.textStyles.poppinsRegular18.copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                  IconButton(onPressed: () {}, icon: AppIcons.search),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GlassContainerWidget(
                country: "Toshkent",
                weather: "Clear",
                humidity: '56',
                wind: '4.63',
                image: Images.sun,
                onPressed: () {
                  context.read<WeatherBloc>().add(
                        const GetAllWeatherEvent(latitude: '52.52', longitude: '13.41', country: ' Toshkent', image: Images.tele),
                      );
                },
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GlassContainerWidget(
                country: "London",
                weather: "Clouds",
                humidity: '65',
                wind: '4.12',
                image: Images.sun,
                onPressed: () {
                  context
                      .read<WeatherBloc>()
                      .add(const GetAllWeatherEvent(latitude: '51.52', longitude: '11.41', country: 'London', image: Images.clock));
                },
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GlassContainerWidget(
                country: "New York",
                weather: "Thunderstorm",
                humidity: '34',
                wind: '9.26',
                image: Images.sun,
                onPressed: () {
                  context
                      .read<WeatherBloc>()
                      .add(const GetAllWeatherEvent(latitude: '50.52', longitude: '10.41', country: "New York", image: Images.statue));
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
