import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/routes/app_routes.dart';
import '../../splash_screen/widgets/preparationCard.dart';
import '../../splash_screen/widgets/quickmentalsessionscard.dart';
import '../screenwidgets/bottomnav_button.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNav(selectIndex: 0),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 50),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset("assets/images/image 34.png"),
                  GestureDetector(
                    onTap: () {
                      print("Notification Tapped");
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(99),
                        color: const Color(0xff251D29),
                      ),
                      child: Image.asset(
                        "assets/images/mingcute_notification-fill.png",
                        width: 40,
                        height: 40,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),
              Center(
                child: Text(
                  "prep_starts".tr,
                  style: const TextStyle(
                    color: Color(0xffFFFFFF),
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),

              const SizedBox(height: 24),

              PreparationCard(
                ontap: () {
                  Get.toNamed(AppRoutes.onlodaingscreen6);
                },
              ),

              const SizedBox(height: 40),
              Center(
                child: Text(
                  "quick_mental_sessions".tr,
                  style: const TextStyle(
                    color: Color(0xff8E85A6),
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
              ),
              const SizedBox(height: 24),

              Quickmentalsessionscard(
                ontap: () {
                  Get.toNamed(AppRoutes.preperformanceFocus);
                },
                name: 'pre_performance_focus'.tr,
              ),

              const SizedBox(height: 10),
              Quickmentalsessionscard(
                ontap: () {
                  Get.toNamed(AppRoutes.confidencereset);
                },
                name: 'confidence_reset'.tr,
              ),
              const SizedBox(height: 10),
              Quickmentalsessionscard(
                ontap: () {
                  Get.toNamed(AppRoutes.pressurecontrol);
                },
                name: 'pressure_control'.tr,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}