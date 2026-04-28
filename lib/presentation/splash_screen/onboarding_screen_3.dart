import 'package:concentrao/presentation/splash_screen/widgets/onboarding_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart'; // generic import for all get features

import '../../core/services/globelcontroller.dart';

class OnboardingScreen3 extends StatelessWidget {
  const OnboardingScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    final Globelcontroller controller = Get.find<Globelcontroller>();

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 90, 20, 160),
        child: Column(
          children: [
            const Center(
              child: Text(
                "Personalized for you",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            const SizedBox(height: 10),

            _buildSelectableCard(controller, 0, "athletic_performance".tr, "perform_clarity_composure".tr),
            _buildSelectableCard(controller, 1, "business_leadership".tr, "execute_confidence_pressure".tr),
            _buildSelectableCard(controller, 2, "competitive_exams".tr, "maintain_focus_matters_most".tr),
            _buildSelectableCard(controller, 3, "personal_mastery".tr, "build_discipline_resilience".tr),
            _buildSelectableCard(controller, 4, "Other".tr, "Describe your specific goal".tr),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectableCard(Globelcontroller controller, int index, String title, String subtitle) {
    return Obx(() => Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: OnboardingCard(
        title: title,
        subtitle: subtitle,
        isSelected: controller.onboardingSelectedCard.value == index,
        onTap: () {
          // ভাইব্রেশন ফিডব্যাক
          HapticFeedback.lightImpact();
          // গ্লোবাল কন্ট্রোলারে ইনডেক্স সেট করা
          controller.onboardingSelectedCard.value = index;
        },
      ),
    ));
  }
}