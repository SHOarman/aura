import 'package:aura/presentation/screeen_ui/motivation/widget/Custom%20Motivation%20Card%20Widget.dart';
import 'package:aura/presentation/screeen_ui/motivation/widget/StreakCalendar.dart';
import 'package:aura/presentation/screeen_ui/motivation/widget/WeeklyActivityChart.dart';
import 'package:aura/presentation/screeen_ui/motivation/widget/progresscard.dart';
import 'package:aura/presentation/screeen_ui/screenwidgets/bottomnav_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import '../../../core/routes/app_routes.dart';

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

              Center(
                child: Text(
                  "Your Porgress",
                  style: TextStyle(
                    color: Color(0xffFCFDFD),
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              SizedBox(height: 20                                                                                                                                                                                                                                                                                                                                                                                                                                    ,),
              //=======================progresscard================
              
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Progresscard(title: "Complete Session", value: "9", icon: Image.asset("assets/images/sessison.png")),
                  Progresscard(title: "Total minute", value: "150", icon: Image.asset("assets/images/timne.png"))
                ],
              ),
              SizedBox(height: 10,),

              //===============activity card===================================================

              WeeklyActivityChart(),
              
              SizedBox(height: 20,),
              //==========================current streak=================================
              
              StreakCalendar(weeklyData: {

                14: false,
                15: false,
                16: false,
                17: true,
                18: true,
                19: true,
                20: true,
              })



              
            ],
          ),
        ),
      ),
    );
  }
}
