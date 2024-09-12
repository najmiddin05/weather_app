import 'package:flutter/material.dart';

class GlassWeatherWidget extends StatelessWidget {
  const GlassWeatherWidget({super.key, required this.date, required this.celsius, required this.number, required this.appIcons});
  final String date;
  final String celsius;
  final String number;
  final Widget appIcons;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          date,
          style: TextStyle(fontSize: 14, color: Color(0xffECECEC)),
        ),
        Transform.translate(offset: Offset(0, 30), child: Transform.scale(scale: 2.5, child: appIcons)),
        Text(
          celsius,
          style: TextStyle(fontSize: 16, color: Color(0xffECECEC)),
        ),
        Text(
          number,
          style: TextStyle(fontSize: 10, color: Color(0xffECECEC)),
        ),
        Text(
          'km/h',
          style: TextStyle(fontSize: 10, color: Color(0xffECECEC)),
        ),
      ],
    );
  }
}
