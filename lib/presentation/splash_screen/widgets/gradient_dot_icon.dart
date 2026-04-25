import 'package:flutter/material.dart';

class GradientDotIcon extends StatelessWidget {
  static const double dotSize = 14.0;

  const GradientDotIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: dotSize,
      height: dotSize,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF8B5CF6),
            Color(0xFFC084FC),
          ],
        ),
      ),
    );
  }
}
