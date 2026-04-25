import 'package:concentrao/presentation/splash_screen/onboarding_screen_2.dart';
import 'package:concentrao/presentation/splash_screen/onboarding_screen_3.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/services/globelcontroller.dart';
import '../../globelwidgets/custombutton.dart';

class OnboardingScreen1 extends StatelessWidget {
  const OnboardingScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    // Globelcontroller ইনজেক্ট করা হচ্ছে
    final Globelcontroller controller = Get.put(Globelcontroller());

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          //--- Main Onboarding Pages ---
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.onPageChanged,
            children: [
              _buildFirstPage(),
              const OnboardingScreen2(),
              const OnboardingScreen3(),
            ],
          ),

          //--- Bottom Controls (Dots & Button) ---
          Positioned(
            bottom: 60,
            left: 20,
            right: 20,
            child: Column(
              children: [
                //--- Animated Smooth Page Indicator ---
                Obx(
                      () => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(3, (index) {
                      bool isActive = controller.currentPage.value == index;
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 6),
                        height: 10,
                        width: isActive ? 40 : 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: isActive
                              ? const LinearGradient(
                            colors: [
                              Color(0xFF4A6CF7),
                              Color(0xFFC159E1),
                            ],
                          )
                              : null,
                          color: isActive ? null : Colors.white.withValues(alpha: 0.2),
                          boxShadow: isActive
                              ? [
                            BoxShadow(
                              color: const Color(0xFFC159E1).withValues(alpha: 0.6),
                              blurRadius: 10,
                              spreadRadius: 1,
                            ),
                          ]
                              : [],
                        ),
                      );
                    }),
                  ),
                ),
                const SizedBox(height: 40),

                //--- Fixed Bottom Button with Validation Logic ---
                Obx(() {
                  // চেক করা হচ্ছে বাটনটি কি 'Disabled' দেখাবে কিনা
                  // যদি ৩ নম্বর পেজে থাকে এবং কোনো কার্ড সিলেক্ট না করা হয়
                  bool isPage3 = controller.currentPage.value == 2;
                  bool hasNoSelection = controller.onboardingSelectedCard.value == -1;
                  bool isDisabled = isPage3 && hasNoSelection;

                  return Opacity(
                    // বাটনটি হালকা হয়ে যাবে যদি সিলেকশন না থাকে
                    opacity: isDisabled ? 0.5 : 1.0,
                    child: Custombutton(
                      text: isPage3 ? "start_btn".tr : "next_btn".tr,
                      ontap: controller.goToNextPage, // কন্ট্রোলারের ভ্যালিডেশন কল হবে
                      gradient: const LinearGradient(
                        colors: [Color(0xFF4A6CF7), Color(0xFFC159E1)],
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // First Page UI
  Widget _buildFirstPage() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 180),
          const Text(
            "Before every defining moment, there is preparation",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            "onboarding_subtitle_1".tr,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.white.withValues(alpha: 0.8),
            ),
          ),
        ],
      ),
    );
  }
}