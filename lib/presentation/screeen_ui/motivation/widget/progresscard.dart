import 'package:flutter/material.dart';

class Progresscard extends StatelessWidget {
  final String title;
  final String value;
  final Widget icon; // Ekhane ekhon jekono Widget (Icon/Image) dewa jabe

  const Progresscard({
    super.key,
    required this.title,
    required this.value,
    required this.icon, // Icon-ta required kore dilam
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: GradientPainter(
        strokeWidth: 1.2,
        radius: 20,
        gradient: const LinearGradient(
          colors: [Color(0xFFD75BE3), Color(0xFF4C65E3)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Container(
        width: 160,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.transparent, // Background transparent
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Custom Icon Container
            Container(
              height: 55,
              width: 55,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                // Halka purple overlay jeta image-e chilo
                color: const Color(0xFFD75BE3).withOpacity(0.15),
              ),
              child: icon, // Tomar dewa icon ekhane show korbe
            ),
            const SizedBox(height: 15),
            // Title
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white.withOpacity(0.9),
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 8),
            // Value
            Text(
              value,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Gradient Border Painter
class GradientPainter extends CustomPainter {
  final double strokeWidth;
  final double radius;
  final Gradient gradient;

  GradientPainter({required this.strokeWidth, required this.radius, required this.gradient});

  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Offset.zero & size;
    final Paint paint = Paint()
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..shader = gradient.createShader(rect);

    final RRect rrect = RRect.fromRectAndRadius(rect, Radius.circular(radius));
    canvas.drawRRect(rrect, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}