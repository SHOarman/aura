import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WeeklyActivityChart extends StatelessWidget {
  const WeeklyActivityChart({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: GradientPainter(
        strokeWidth: 1.2,
        radius: 20,
        gradient: const LinearGradient(
          colors: [Color(0xFFD75BE3), Color(0xFF4C65E3)],
        ),
      ),
      child: Container(
        height: 220,
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Weekly activity".tr,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w400
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: LineChart(
                mainData(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: const FlGridData(show: false),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 30,
            getTitlesWidget: (value, meta) => Text(
              value.toInt().toString(),
              style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 12),
            ),
            reservedSize: 30,
          ),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: (value, meta) {
              // Mapping indices to your translation keys
              const dayKeys = [
                'sun',
                'mon',
                'tue',
                'wed',
                'thu',
                'fri',
                'sat'
              ];

              return Text(
                dayKeys[value.toInt() % 7].tr, // Translates to S, M, T, etc.
                style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 12),
              );
            },
          ),
        ),
      ),
      borderData: FlBorderData(show: false),
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 10),
            FlSpot(1, 60),
            FlSpot(2, 40),
            FlSpot(3, 90),
            FlSpot(4, 35),
            FlSpot(5, 80),
            FlSpot(6, 30),
          ],
          isCurved: true,
          color: const Color(0xFFD75BE3),
          barWidth: 3,
          isStrokeCapRound: true,
          dotData: const FlDotData(show: false),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: [
                const Color(0xFFD75BE3).withOpacity(0.4),
                const Color(0xFFD75BE3).withOpacity(0.0),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
      ],
    );
  }
}

class GradientPainter extends CustomPainter {
  final double strokeWidth;
  final double radius;
  final Gradient gradient;

  GradientPainter({
    required this.strokeWidth,
    required this.radius,
    required this.gradient
  });

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