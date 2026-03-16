import 'package:aura/core/routes/app_routes.dart';
import 'package:aura/presentation/screeen_ui/profile/profile/profilewidget/subscriptionCard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/services/globelcontroller.dart';

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Globelcontroller());

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Upgrade to Aura Premium".tr,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 20),
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // 1. Free Trial Card (Index 0)
            _buildSelectableCard(
              controller,
              index: 0,
              title: "Free trial".tr,
              features: [
                "1 AI visualization per day OR 1 total".tr,
                "Max duration 10–15 min".tr,
                "1–2 ambiences".tr,
                "1 standard voice".tr,
              ],
            ),

            const SizedBox(height: 16),

            // 2. Monthly Premium Card (Index 1) - Updated Price
            _buildSelectableCard(
              controller,
              index: 1,
              title: "Monthly".tr,
              price: "\$9.99",
              features: [
                "Unlimited".tr,
                "30 min".tr,
                "All ambiences".tr,
                "Premium voices".tr,
                "Save + favorites + full history".tr,
              ],
            ),

            const SizedBox(height: 16),

            // 3. Annual Premium Card (Index 2) - New Plan
            _buildSelectableCard(
              controller,
              index: 2,
              title: "Annual".tr,
              price: "\$79.99",
              subPrice: "\$6.67/mo", // প্রদর্শনের জন্য ছোট করে নিচে দেওয়া যায়
              discount: "Save 33%".tr, // Updated Discount
              features: [
                "Everything in Monthly".tr,
                "Best Value for money".tr,
              ],
            ),

            const SizedBox(height: 40),

            // Continue Button
            Container(
              width: double.infinity,
              height: 55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: const LinearGradient(
                  colors: [Color(0xFF4C65E3), Color(0xFFD75BE3)],
                ),
              ),
              child: ElevatedButton(
                onPressed: () {

                  Get.toNamed(AppRoutes.home);
                  print("Selected Plan Index: ${controller.selectedSubscription.value}");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Text(
                  "continue_btn".tr,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

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
        onTap: () => controller.selectSubscription(index),
        child: Container(
          padding: const EdgeInsets.all(1.5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: isSelected
                ? const LinearGradient(
              colors: [Color(0xFF4C65E3), Color(0xFFD75BE3)],
            )
                : null,
          ),
          child: SubscriptionCard(
            title: title,
            price: price,

            discount: discount,
            features: features,
            isSelected: isSelected,
          ),
        ),
      );
    });
  }
}