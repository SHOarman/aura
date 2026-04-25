
import 'package:flutter/material.dart';

class OnboardingCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isSelected; // Nutun parameter
  final VoidCallback onTap;

  const OnboardingCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.isSelected = false, // Default false
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          // Select hole gradient border ba highlight
          border: Border.all(
            color: isSelected ? const Color(0xFFC159E1) : Colors.white10,
            width: 1.5,
          ),
          color: isSelected ? const Color(0xFFC159E1).withValues(alpha: 0.05) : Colors.transparent,
        ),
        child: CustomPaint(
          // ... apnar existing GradientPainter logic thakbe ...
          child: Container(
            height: 80,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(title, style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
                const SizedBox(height: 5),
                Text(subtitle, style: TextStyle(color: Colors.white.withValues(alpha: 0.7), fontSize: 12)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}