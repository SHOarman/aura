import 'package:flutter/material.dart';

class CustomGradientBox extends StatelessWidget {
  final Widget child;
  final double borderRadius;
  final double strokeWidth;

  const CustomGradientBox({
    super.key,
    required this.child,
    this.borderRadius = 24.0,
    this.strokeWidth = 2.0,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: GradientPainter(
        strokeWidth: strokeWidth,
        radius: borderRadius,
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0x804C65E3),
            Color(0x33D75BE3),
          ],
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0x4D1B1424),
              Color(0x26574074),
            ],
          ),
        ),
        padding: const EdgeInsets.all(24.0),
        child: child,
      ),
    );
  }
}

class GradientPainter extends CustomPainter {
  final Paint _paint = Paint();
  final double radius;
  final double strokeWidth;
  final Gradient gradient;

  GradientPainter({
    required this.strokeWidth,
    required this.radius,
    required this.gradient,
  });

  @override
  void paint(Canvas canvas, Size size) {

    Rect rect = Offset.zero & size;
    RRect rrect = RRect.fromRectAndRadius(rect, Radius.circular(radius));

    _paint.shader = gradient.createShader(rect);
    _paint.style = PaintingStyle.stroke;
    _paint.strokeWidth = strokeWidth;

    canvas.drawRRect(rrect, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}