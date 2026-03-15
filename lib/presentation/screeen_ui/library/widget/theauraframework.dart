import 'package:flutter/material.dart';

class Theauraframework extends StatelessWidget {
  final String title;               // টাইটেলের জন্য
  final List<String> bulletPoints;  // বর্ণনা বা লিস্টের জন্য
  final String buttonText;          // বাটনের টেক্সটের জন্য
  final VoidCallback onTap;         // বাটনে ক্লিক করলে যা হবে

  const Theauraframework({
    super.key,
    required this.title,
    required this.bulletPoints,
    required this.onTap,
    this.buttonText = 'View Details', // ডিফল্ট টেক্সট
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
          color: Colors.transparent,
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
                  // কাস্টম টাইটেল
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24, // সাইজ সামান্য অ্যাডজাস্ট করা হয়েছে
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // লিস্ট ডাইনামিকভাবে তৈরি হবে
                  ...bulletPoints.map((text) => _buildBulletText(text)).toList(),

                  const SizedBox(height: 20),

                  // কাস্টম বাটন
                  InkWell(
                    onTap: onTap, // সরাসরি কল হবে
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

// GradientBorderPainter আগের মতোই থাকবে...
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