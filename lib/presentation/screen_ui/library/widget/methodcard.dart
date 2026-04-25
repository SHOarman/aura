import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MethodCard extends StatelessWidget {
  final VoidCallback onTap;

  const MethodCard({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const double cardWidth = 355.0;
    const double cardRadius = 20.0;
    const double borderWidth = 1.2;

    return Container(
      width: cardWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(cardRadius),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF4C65E3),
            Color(0xFFD75BE3)
          ],
        ),
      ),
      child: Container(
        margin: const EdgeInsets.all(borderWidth),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(cardRadius - borderWidth),
          color: const Color(0xFF1B1424),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // TOP SECTION
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "last_generated_session".tr,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'pressure_control'.tr,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'five_min'.tr,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'generated_guided'.tr,
                    style: const TextStyle(
                      color: Color(0xFFC7C5D1),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),

            // DIVIDER
            Divider(
              height: 1,
              thickness: 1,
              color: Colors.white.withValues(alpha: 0.1),
            ),

            // BOTTOM SECTION (Play Button)
            GestureDetector(
              onTap: onTap,
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(cardRadius),
                    bottomRight: Radius.circular(cardRadius),
                  ),
                  gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(27, 20, 36, 0.6),
                      Color.fromRGBO(87, 64, 116, 0.3)
                    ],
                  ),
                ),
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 44,
                      height: 44,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [Color(0xFFD75BE3), Color(0xFF4C65E3)],
                        ),
                      ),
                      child: const Icon(Icons.play_arrow_rounded, color: Colors.white, size: 30),
                    ),
                    const SizedBox(width: 15),
                    Text(
                      'play_again'.tr,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
