import 'package:flutter/material.dart';

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
        // ২. এই মার্জিনটিই মূলত বর্ডারের থিকনেস বা পুরুত্ব তৈরি করে
        margin: const EdgeInsets.all(borderWidth),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(cardRadius - borderWidth),
          // কার্ডের ভেতরের ব্যাকগ্রাউন্ড কালার (ইমেজের মতো গাঢ় রাখতে চাইলে dark color দিন)
          color: const Color(0xFF130E1A),
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
                children: const [
                  Text(
                    "Last Generated Session",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Pressure Control',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '10 min',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Generated · Guided',
                    style: TextStyle(
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
              color: Colors.white.withOpacity(0.1),
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
                    // begin: Alignment.topCenter,
                    // end: Alignment.bottomCenter,
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
                    const Text(
                      'Play Again',
                      style: TextStyle(
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