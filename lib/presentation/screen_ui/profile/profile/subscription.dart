import 'package:concentrao/core/routes/app_routes.dart';
import 'package:concentrao/presentation/screen_ui/profile/profile/profilewidget/subscription_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Haptic feedback এর জন্য
import 'package:get/get.dart';
import '../../../../core/services/globelcontroller.dart';

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Controller initialize
    final controller = Get.put(Globelcontroller());

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Unlock your full potential".tr, // Report: Updated title
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 20),
          onPressed: () => Get.back(),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            // Bottom-এ বাটনের জন্য পর্যাপ্ত স্পেস রাখা হয়েছে (120 padding)
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 150),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),

                // 1. Free Trial Card
                _buildSelectableCard(
                  controller,
                  index: 0,
                  title: "Free trial".tr,
                  features: [
                    "Limited access to AI sessions".tr, // Report: Removed specific counts
                    "Standard quality audio".tr,
                  ],
                ),

                const SizedBox(height: 16),

                // 2. Monthly Premium Card
                _buildSelectableCard(
                  controller,
                  index: 1,
                  title: "Monthly".tr,
                  price: "\$9.99",
                  subPrice: "/mo",
                  features: [
                    "Unlimited sessions".tr, // Report: Added context
                    "Up to 30 min per session".tr, // Report: Added context
                    "All environments".tr, // Report: Renamed from Ambiences
                    "Premium voices".tr,
                    "Save sessions, favorites & full history".tr, // Report: Requirement
                  ],
                ),

                const SizedBox(height: 16),

                // 3. Annual Premium Card (Recommended)
                _buildSelectableCard(
                  controller,
                  index: 2,
                  title: "Annual".tr,
                  price: "\$79.99",
                  subPrice: "/ year", // Report: Removed misleading /mo
                  discount: "Save \$39.89 per year".tr, // Report: Concrete benefit
                  features: [
                    "Unlimited sessions".tr,
                    "Priority AI generation".tr,
                    "All premium features included".tr,
                  ],
                ),
              ],
            ),
          ),

          // 4. Sticky Bottom Button Section (Report: Sticky and Reassurance line)
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(20, 40, 20, 30),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withValues(alpha: 0),
                    Colors.black.withValues(alpha: 0.8),
                    Colors.black,
                  ],
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: double.infinity,
                    height: 58,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: const LinearGradient(
                        colors: [Color(0xFF4C65E3), Color(0xFFD75BE3)],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFFD75BE3).withValues(alpha: 0.3),
                          blurRadius: 15,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        // Haptic feedback for premium feel
                        HapticFeedback.mediumImpact();
                        Get.toNamed(AppRoutes.home);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Text(
                        "Start my training".tr, // Report: Replaced "Continue"
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Cancel anytime · Secure payment".tr, // Report: Reassurance line
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.5),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Selectable Card Builder with Glow and Haptic Feedback
  Widget _buildSelectableCard(
      Globelcontroller controller, {
        required int index,
        required String title,
        String? price,
        String? subPrice,
        String? discount,
        required List<String> features,
      }) {
    return Obx(() {
      bool isSelected = controller.selectedSubscription.value == index;
      return GestureDetector(
        onTap: () {
          // Report Requirement: Haptic Feedback
          HapticFeedback.lightImpact();
          controller.selectSubscription(index);
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          padding: const EdgeInsets.all(1.5), // Gradient Border thickness
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: isSelected
                ? const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF4C65E3), Color(0xFFD75BE3)],
            )
                : const LinearGradient(
              colors: [Colors.white10, Colors.white10],
            ),
            boxShadow: isSelected
                ? [
              BoxShadow(
                color: const Color(0xFFD75BE3).withValues(alpha: 0.2),
                blurRadius: 12,
                spreadRadius: 2,
              )
            ]
                : [],
          ),
          child: SubscriptionCard(
            title: title,
            price: price,
            subPrice: subPrice, // Passing subPrice separately to avoid /mo confusion
            discount: discount,
            features: features,
            isSelected: isSelected,
          ),
        ),
      );
    });
  }
}