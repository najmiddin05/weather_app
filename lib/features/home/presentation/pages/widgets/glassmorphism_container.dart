import 'dart:ui';

import 'package:flutter/material.dart';

class GlassmorphismContainer extends StatelessWidget {
  const GlassmorphismContainer({super.key, required this.child, this.color = const Color(0xff535353), this.height = 150});
  final Widget child;
  final Color color;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: DecoratedBox(
              decoration: BoxDecoration(
                color: color.withOpacity(0.6),
                borderRadius: BorderRadius.circular(20),
              ),
              child: child),
        ),
      ),
    );
  }
}
