import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:concentrao/core/routes/app_routes.dart';
import 'package:concentrao/presentation/splash_screen/widgets/preparation_card.dart';
import 'package:concentrao/presentation/splash_screen/widgets/quick_mental_sessions_card.dart';
import 'package:concentrao/presentation/screen_ui/screenwidgets/bottomnav_button.dart';
import '../aicreate/create_script_screen.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNav(selectIndex: 0),
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 50),

              // Top Bar: Logo & Notification
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset("assets/images/image 34.png"),
                  GestureDetector(
                    onTap: () {
                      debugPrint("Notification Tapped");
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

              // Main Preparation Card
              PreparationCard(
                ontap: () {
                  Get.toNamed(AppRoutes.prePerformanceFocusDetailsScreen);
                },
              ),

              const SizedBox(height: 30),
              Center(
                child: Text(
                  "quick_mental_sessions".tr,
                  style: const TextStyle(
                    color: Color(0xffFFFFFF),
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
              ),
              const SizedBox(height: 20),


              Quickmentalsessionscard(
                ontap: () {
                  Get.to(() => const Createscriptscreen(
                    isConcentraoMode: false,
                    initialCategory: "Pre-Performance Focus",
                  ));
                },
                name: 'pre_performance_focus'.tr,
              ),

              const SizedBox(height: 12),

              Quickmentalsessionscard(
                ontap: () {
                  Get.to(() => const Createscriptscreen(
                    isConcentraoMode: false,
                    initialCategory: "Confidence Reinforcement",
                  ));
                },
                name: 'confidence_reinforcement'.tr,
              ),

              const SizedBox(height: 12),

              Quickmentalsessionscard(
                ontap: () {
                  Get.to(() => const Createscriptscreen(
                    isConcentraoMode: false,
                    initialCategory: "Pressure Control",
                  ));
                },
                name: 'pressure_control'.tr,
              ),

              const SizedBox(height: 12),

              Quickmentalsessionscard(
                ontap: () {
                  Get.to(() => const Createscriptscreen(
                    isConcentraoMode: false,
                    initialCategory: "Peak State Activation",
                  ));
                },
                name: 'peak_state_activation'.tr,
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}