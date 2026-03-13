import 'package:aura/core/routes/app_routes.dart';
import 'package:aura/globelwidgets/custombutton.dart';
import 'package:aura/presentation/splash_screen/widgets/onlodingcard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Onlodingscreen3 extends StatelessWidget {
  const Onlodingscreen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              SizedBox(height: 110),

              Center(
                child: Text(
                  "what_preparing_for".tr,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),

              SizedBox(height: 30),

              Onlodingcard(
                title: "athletic_performance".tr,
                subtitle: "perform_clarity_composure".tr,
                onTap: () {},
              ),

              SizedBox(height: 8),
              Onlodingcard(
                title: "business_leadership".tr,
                subtitle: "execute_confidence_pressure".tr,
                onTap: () {},
              ),
              SizedBox(height: 8),
              Onlodingcard(
                title: "competitive_exams".tr,
                subtitle: "maintain_focus_matters_most".tr,
                onTap: () {},
              ),
              SizedBox(height: 8),
              Onlodingcard(
                title: "personal_mastery".tr,
                subtitle: "build_discipline_resilience".tr,
                onTap: () {


                },
              ),
              SizedBox(height: 120),
              Center(
                child: Text(
                  "answer_helps_personalize".tr,
                  style: TextStyle(
                    color: Color(0xffFFFFFF),
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
              ),

              SizedBox(height: 200),

              // Custombutton(
              //   text: "Continue",
              //   ontap: () {
              //
              //     Get.toNamed(AppRoutes.onlodaingscreen4);
              //
              //     //=========================================================
              //   },
              //   gradient: LinearGradient(
              //     colors: [Color(0xFF4A6CF7), Color(0xFFC159E1)],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
