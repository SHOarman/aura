import 'package:flutter/material.dart';

class StreakCalendar extends StatelessWidget {
  // Ekhane amra map nibo jekhane Tarikh (Key) ebong Active ki na (Value) thakbe
  final Map<int, bool> weeklyData;
  final List<String> daysName = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];

  StreakCalendar({
    super.key,
    required this.weeklyData, // Udahoron: {14: false, 15: false, 16: false, 17: true...}
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Current Streak",
          style: TextStyle(
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
            int date = weeklyData.keys.elementAt(index);
            bool isActive = weeklyData[date] ?? false;
            String dayName = daysName[index];

            return Column(
              children: [
                // Din-er naam (S, M, T...)
                Text(
                  dayName,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.5),
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
                    // Active hole gradient background, na hole transparent
                    gradient: isActive
                        ? const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xFFD75BE3), Color(0xFF4C65E3)],
                    )
                        : null,
                  ),
                  child: Text(
                    date.toString(),
                    style: TextStyle(
                      color: isActive ? Colors.white : Colors.white.withOpacity(0.3),
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