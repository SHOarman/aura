import 'package:flutter/material.dart';

class Theconcentraoframework extends StatelessWidget {
  final String title;
  final List<String> bulletPoints;
  final String buttonText;
  final VoidCallback onTap;

  const Theconcentraoframework({
    super.key,
    required this.title,
    required this.bulletPoints,
    required this.onTap,
    this.buttonText = 'View Details',
  });

  @override
  Widget build(BuildContext context) {
    const double cardRadius = 16.0;

    return CustomPaint(
      painter: GradientBorderPainter(
        radius: cardRadius,
        strokeWidth: 1.5,
        gradient: const LinearGradient(
          colors: [Color(0xFF4C65E3), Color(0xFFD75BE3)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Container(
        width: 355,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(cardRadius),
          gradient: const LinearGradient(
            colors: [
              Color(0x4D1B1424), // #1B1424 with 30% opacity (4D)
              Color(0x26574074), // #574074 with 15% opacity (26)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 16),

                  ...bulletPoints.map((text) => _buildBulletText(text)),

                  const SizedBox(height: 20),

                  InkWell(
                    onTap: onTap,
                    child: Text(
                      buttonText,
                      style: const TextStyle(
                        color: Color(0xFFD75BE3),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline,
                        decorationColor: Color(0xFFD75BE3),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBulletText(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('• ', style: TextStyle(color: Colors.white70, fontSize: 16)),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GradientBorderPainter extends CustomPainter {
  final double radius;
  final double strokeWidth;
  final Gradient gradient;

  GradientBorderPainter({
    required this.radius,
    required this.strokeWidth,
    required this.gradient,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = Offset.zero & size;
    RRect rrect = RRect.fromRectAndRadius(rect, Radius.circular(radius));
    Paint paint = Paint()
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..shader = gradient.createShader(rect);
    canvas.drawRRect(rrect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
