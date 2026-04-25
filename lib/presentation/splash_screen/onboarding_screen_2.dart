import 'package:flutter/material.dart';
import 'package:get/get.dart';


class OnboardingScreen2 extends StatelessWidget {
  const OnboardingScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(height: 180),

                  Center(
                    child: Text(
                      "Concentrao is mental\nperformance training.".tr,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        height: 1.3,
                      ),
                    ),
                  ),

                  const SizedBox(height: 70),

                  // --- Concept Items with Icons (Report Requirement) ---
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: _buildGradientItem(
                            "Not meditation".tr,
                            icon: Icons.self_improvement_outlined,
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: _buildGradientItem(
                            "but preparation".tr,
                            icon: Icons.psychology_outlined,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),

                  // --- Full Width Item (Corrected Spelling: Preparation) ---
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: _buildGradientItem(
                      "Preparation".tr,
                      isFullWidth: true,
                      icon: Icons.track_changes_outlined,
                    ),
                  ),

                  const SizedBox(height: 150),
                ],
              ),
            ),
          ),

          // --- Bottom Navigation (Dots & Button) ---

        ],
      ),
    );
  }

  // --- Concept Item Builder with Icon and Gradient Line ---
  Widget _buildGradientItem(String text, {bool isFullWidth = false, IconData? icon}) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              Icon(icon, color: Colors.white70, size: 18),
              const SizedBox(width: 8),
            ],
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Container(
          height: 1.5,
          width: isFullWidth ? double.infinity : null,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color(0xFF4A6CF7).withValues(alpha: 0.1),
                const Color(0xFFC159E1),
                const Color(0xFF4A6CF7).withValues(alpha: 0.1),
              ],
            ),
          ),
        ),
      ],
    );
  }


}