import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Required for .tr extension

class StreakCalendar extends StatelessWidget {
  // Map containing Date (Key) and Active status (Value)
  final Map<int, bool> weeklyData;

  // Using the translation keys you provided
  final List<String> daysNameKeys = [
    'sun_single',
    'mon_single',
    'tue_single',
    'wed_single',
    'thu_single',
    'fri_single',
    'sat_single'
  ];

  StreakCalendar({
    super.key,
    required this.weeklyData, // Example: {14: false, 15: false, 16: false, 17: true...}
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "current_streak".tr, // Added .tr
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(7, (index) {
            // Data processing
            // Safely get date and status
            int date = weeklyData.keys.elementAt(index);
            bool isActive = weeklyData[date] ?? false;
            String dayLabel = daysNameKeys[index].tr; // Translates to S, M, T, etc.

            return Column(
              children: [
                // Day name translated (S, M, T...)
                Text(
                  dayLabel,
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.5),
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 12),

                // Active/Inactive Circle
                Container(
                  height: 45,
                  width: 45,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    // Active: Gradient background | Inactive: Border/Transparent
                    gradient: isActive
                        ? const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xFFD75BE3), Color(0xFF4C65E3)],
                    )
                        : null,
                    border: !isActive
                        ? Border.all(color: Colors.white.withValues(alpha: 0.1))
                        : null,
                  ),
                  child: Text(
                    date.toString(),
                    style: TextStyle(
                      color: isActive ? Colors.white : Colors.white.withValues(alpha: 0.3),
                      fontSize: 18,
                      fontWeight: isActive ? FontWeight.bold : FontWeight.w400,
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
      ],
    );
  }
}
