import 'package:flutter/material.dart';
import 'package:weather_app/features/home/presentation/pages/widgets/glassmorphism_container.dart';

class GlassContainerWidget extends StatelessWidget {
  const GlassContainerWidget({
    super.key,
    required this.country,
    required this.weather,
    required this.humidity,
    required this.wind,
    required this.image,
    required this.onPressed,
  });
  final String country;
  final String weather;
  final String humidity;
  final String wind;
  final String image;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onPressed,
        child: GlassmorphismContainer(
          color: const Color(0xffAAA5A5B2),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      country,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      weather,
                      style: TextStyle(fontSize: 16, color: Colors.white70, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 10),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16, color: Colors.white.withOpacity(0.8)),
                        children: [
                          TextSpan(text: 'Humidity '),
                          TextSpan(
                            text: "$humidity %",
                            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16, color: Colors.white.withOpacity(0.8)),
                        children: [
                          TextSpan(text: 'Wind '),
                          TextSpan(
                            text: "$wind km/h",
                            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage(image),
                      height: 50,
                    ),
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Text(
                          '24',
                          style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.w500),
                        ),
                        Transform.translate(
                          offset: Offset(15, -7),
                          child: Text(
                            '°C',
                            style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
