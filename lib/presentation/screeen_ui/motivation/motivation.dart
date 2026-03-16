import 'package:aura/presentation/screeen_ui/motivation/widget/StreakCalendar.dart';
import 'package:aura/presentation/screeen_ui/motivation/widget/WeeklyActivityChart.dart';
import 'package:aura/presentation/screeen_ui/motivation/widget/progresscard.dart';
import 'package:aura/presentation/screeen_ui/screenwidgets/bottomnav_button.dart';
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
                  Image.asset(
                    "assets/images/image 34.png",
                    height: 30, // Specified height for alignment
                    width: 30,
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Text(
                      "Your Progress".tr,
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

              //=======================progresscard================
              Row(
                children: [
                  Expanded(
                    child: Progresscard(
                      title: "Complete Session".tr,
                      value: "9",
                      icon: Image.asset("assets/images/sessison.png"),
                    ),
                  ),
                  const SizedBox(width: 12), // Space between cards
                  Expanded(
                    child: Progresscard(
                      title: "Total minute".tr,
                      value: "150",
                      icon: Image.asset("assets/images/timne.png"),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              //===============activity card==========================
              const WeeklyActivityChart(),

              const SizedBox(height: 20),

              //==========================current streak==============
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

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}