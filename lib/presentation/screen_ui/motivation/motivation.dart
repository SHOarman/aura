import 'package:concentrao/presentation/screen_ui/motivation/widget/streak_calendar.dart';
import 'package:concentrao/presentation/screen_ui/motivation/widget/weekly_activity_chart.dart';
import 'package:concentrao/presentation/screen_ui/motivation/widget/progresscard.dart';
import 'package:concentrao/presentation/screen_ui/screenwidgets/bottomnav_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Motivation extends StatelessWidget {
  const Motivation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      bottomNavigationBar: const CustomBottomNav(selectIndex: 3),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 60),

              Row(
                children: [
                  Image.asset("assets/images/image 34.png"),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Text(
                      "Your mental training".tr,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Color(0xffFCFDFD),
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // --- Progress Cards ---
              Row(
                children: [
                  Expanded(
                    child: Progresscard(
                      title: "Sessions completed".tr,
                      value: "9",
                      icon: Image.asset("assets/images/sessison.png"),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Progresscard(
                      title: "Total minutes".tr,
                      value: "150",
                      icon: Image.asset("assets/images/timne.png"),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              const WeeklyActivityChart(),

              const SizedBox(height: 20),

              // --- Current Streak & Calendar ---
              StreakCalendar(
                weeklyData: const {
                  14: false,
                  15: false,
                  16: false,
                  17: true,
                  18: true,
                  19: true,
                  20: true,
                },
              ),

              const SizedBox(height: 20),
              Center(
                child: Text(
                  "Don't break your streak".tr,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,

                  ),
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}