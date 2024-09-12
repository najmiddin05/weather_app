import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget {
  const GradientBackground({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF391A49), // #391A49
            Color(0xFF301D5C), // #301D5C
            Color(0xFF262171), // #262171
            Color(0xFF301D5C), // #301D5C
            Color(0xFF391A49), // #391A49
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: child,
    );
  }
}
