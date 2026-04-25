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
        height: 240, // Height ektu baranu hoyeche tooltip er jayga rakhar jonno
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
              "This week".tr, // Report onujayi title change kora hoyeche
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600 // Ektu bold kora hoyeche premium feel er jonno
              ),
            ),
            const SizedBox(height: 25),
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
    const dayKeys = ['sun', 'mon', 'tue', 'wed', 'thu', 'fri', 'sat'];

    return LineChartData(
      minY: 0, // Y-axis 0 theke shuru hobe (Report logic)
      gridData: const FlGridData(show: false),
      // --- INTERACTIVE TOOLTIP LOGIC ---
      lineTouchData: LineTouchData(
        handleBuiltInTouches: true,
        touchTooltipData: LineTouchTooltipData(
          getTooltipColor: (touchedSpot) => const Color(0xFF1B1424), // Popup background
          tooltipBorder: const BorderSide(color: Color(0xFF574074), width: 1),
          getTooltipItems: (List<LineBarSpot> touchedSpots) {
            return touchedSpots.map((spot) {
              return LineTooltipItem(
                '${dayKeys[spot.x.toInt()].tr} \n', // Day name
                const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    text: '${spot.y.toInt()} min', // Minutes
                    style: const TextStyle(color: Color(0xFFD75BE3), fontWeight: FontWeight.normal),
                  ),
                ],
              );
            }).toList();
          },
        ),
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 30,
            getTitlesWidget: (value, meta) => Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Text(
                '${value.toInt()} min', // "min" unit add kora hoyeche
                style: TextStyle(color: Colors.white.withValues(alpha: 0.6), fontSize: 10),
              ),
            ),
            reservedSize: 45, // Unit er jonno ektu beshi jayga rakha hoyeche
          ),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: (value, meta) {
              if (value < 0 || value >= 7) return const SizedBox();
              return Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  dayKeys[value.toInt()].tr,
                  style: TextStyle(color: Colors.white.withValues(alpha: 0.6), fontSize: 12),
                ),
              );
            },
          ),
        ),
      ),
      borderData: FlBorderData(show: false),
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 10), // Starting point check
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
          dotData: const FlDotData(show: true), // Points gulo dekhanu hoyeche premium look er jonno
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: [
                const Color(0xFFD75BE3).withValues(alpha: 0.3),
                const Color(0xFFD75BE3).withValues(alpha: 0.0),
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

// GradientPainter class ti apnar ager motoi thakbe
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