import 'package:concentrao/presentation/screen_ui/library/widget/saving_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
      bottomNavigationBar: const CustomBottomNav(selectIndex: 0),
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/images/new.svg",
                    height: 80,
                    width: 80,
                    fit: BoxFit.contain,
                    alignment: Alignment.centerLeft,
                  ),

                  GestureDetector(
                    onTap: () {
                      debugPrint("Notification Tapped");
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color(0xff251D29),
                      ),
                      child: Image.asset(
                        "assets/images/mingcute_notification-fill.png",
                        width: 24,
                        height: 24,
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
                  Get.to(
                    () => SavingScreen(
                      title: "",
                      subTitle: "This is best way ",
                      category: 'pre_performance_focus'.tr,
                      duration: "5 Min",
                      imagePath: "assets/images/voice.png",
                    ),
                  );
                },
                name: 'pre_performance_focus'.tr,
              ),

              const SizedBox(height: 12),

              Quickmentalsessionscard(
                ontap: () {
                  Get.to(
                    () => SavingScreen(
                      title: "",
                      subTitle: "good app",
                      category: 'confidence_reinforcement'.tr,
                      duration: "10 Min",
                      imagePath: "assets/images/Rectangle 5.png",
                    ),
                  );
                },
                name: 'confidence_reinforcement'.tr,
              ),

              const SizedBox(height: 12),

              Quickmentalsessionscard(
                ontap: () {
                  Get.to(
                    () => SavingScreen(
                      title: "",
                      subTitle: "know okh",
                      category: 'pressure_control'.tr,
                      duration: "5 Min",
                      imagePath: "assets/images/Rectangle 7.png",
                    ),
                  );
                },
                name: 'pressure_control'.tr,
              ),

              const SizedBox(height: 12),

              Quickmentalsessionscard(
                ontap: () {
                  Get.to(
                    () => SavingScreen(
                      title: "",
                      subTitle: "Done",
                      category: 'peak_state_activation'.tr,
                      duration: "10 Min",
                      imagePath: "assets/images/Rectangle 9.png",
                    ),
                  );
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
