import 'package:aura/presentation/splash_screen/onlodingScreen3.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/services/globelcontroller.dart';
import '../../globelwidgets/custombutton.dart';
import 'onlodaingscreen2.dart';

class Onlodingscreen extends StatelessWidget {
  const Onlodingscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Globelcontroller controller = Get.put(Globelcontroller());

    return Scaffold(
      backgroundColor: Colors.transparent,
      // AppBar eikhane condition apply kora hoyeche
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Obx(() => controller.currentPage.value == 0
              ? PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'en') {
                Get.updateLocale(const Locale('en', 'US'));
              } else if (value == 'fr') {
                Get.updateLocale(const Locale('fr', 'FR'));
              }
            },
            color: const Color(0xFF1A1124),
            offset: const Offset(0, 50),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              margin: const EdgeInsets.only(right: 15),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white54),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Row(
                children: [
                  Icon(Icons.language, color: Colors.white, size: 18),
                  SizedBox(width: 5),
                  Text(
                    "Language",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  Icon(Icons.arrow_drop_down, color: Colors.white),
                ],
              ),
            ),
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'en',
                child: Text("English", style: TextStyle(color: Colors.white)),
              ),
              const PopupMenuItem(
                value: 'fr',
                child: Text("Français", style: TextStyle(color: Colors.white)),
              ),
            ],
          )
              : const SizedBox.shrink(),
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.onPageChanged,
            children: [
              _buildFirstPage(),
              Onlodaingscreen2(),
              Onlodingscreen3(),
            ],
          ),

          Positioned(
            bottom: 60,
            left: 20,
            right: 20,
            child: Column(
              children: [
                Obx(
                      () => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(3, (index) {
                      bool isActive = controller.currentPage.value == index;
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        height: 7,
                        width: isActive ? 24 : 8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          gradient: isActive
                              ? const LinearGradient(
                            colors: [
                              Color(0xFF4A6CF7),
                              Color(0xFFC159E1),
                            ],
                          )
                              : null,
                          color: isActive ? null : Colors.white,
                        ),
                      );
                    }),
                  ),
                ),

                const SizedBox(height: 40),

                // Continue Button
                Custombutton(
                  text: "continue_btn".tr,
                  ontap: controller.goToNextPage,
                  gradient: const LinearGradient(
                    colors: [Color(0xFF4A6CF7), Color(0xFFC159E1)],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFirstPage() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 180),
          Text(
            "onboarding_title_1".tr,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            "onboarding_subtitle_1".tr,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }
}