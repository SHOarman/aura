import 'package:flutter/material.dart';

class GradientBorderContainer extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const GradientBorderContainer({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    // বর্ডারের জন্য ইরিডিসেন্ট কালার
    final List<Color> iridescentColors = [
      const Color(0xFF4C65E3),
      const Color(0xFFD75BE3)
    ];

    // আপনার কাঙ্ক্ষিত ব্যাকগ্রাউন্ড গ্রাডিয়েন্ট কালার (ডার্ক প্রিমিয়াম লুক)
    final List<Color> bgGradientColors = [
      const Color(0x4D1B1424), // #1B1424 with 30% opacity
      const Color(0x26574074), // #574074 with 15% opacity
    ];

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
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            // ব্যাকগ্রাউন্ডে গ্রাডিয়েন্ট যোগ করা হয়েছে
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: bgGradientColors,
            ),
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
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
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