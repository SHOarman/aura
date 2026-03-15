import 'package:flutter/material.dart';

class GradientBorderContainer extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  const GradientBorderContainer({super.key, required this.title, required this.subtitle, required this.onTap});

  @override
  Widget build(BuildContext context) {
    // These are the exact colors extracted from the "Iridescent Gradient" in your image
    final List<Color> iridescentColors = [
      Color(0xFF4C65E3),
      Color(0xFFD75BE3)

    ];

    const Color bgColor = Colors.transparent;

    return CustomPaint(
      painter: _GradientPainter(
        strokeWidth: 2.0,
        radius: 12.0,
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: iridescentColors,
        ),
      ),
      child: GestureDetector(
        onTap: (){
          onTap();
        },
        child: Container(
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text(
                   title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                   SizedBox(height: 4),
                  Text(
                      subtitle,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.5),
                      fontSize: 12,
                      fontWeight: FontWeight.w400
                    ),
                  ),
                ],
              ),
              const Row(
                children: [
                  Text(
                    'Play',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  SizedBox(width: 4),
                  Icon(Icons.play_arrow_rounded, color: Colors.white, size: 24),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _GradientPainter extends CustomPainter {
  final double strokeWidth;
  final double radius;
  final Gradient gradient;

  _GradientPainter({
    required this.strokeWidth,
    required this.radius,
    required this.gradient,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Offset.zero & size;
    final RRect rrect = RRect.fromRectAndRadius(rect, Radius.circular(radius));

    final Paint paint = Paint()
      ..shader = gradient.createShader(rect)
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawRRect(rrect, paint);
  }

  @override
  bool shouldRepaint(covariant _GradientPainter oldDelegate) {
    return oldDelegate.gradient != gradient || oldDelegate.radius != radius;
  }
}