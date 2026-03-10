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
        title: const Text(
          "Upgrade to Aura Premium",
          style: TextStyle(
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
            // Free Trial Card
            _buildSelectableCard(
              controller,
              index: 0,
              title: "Free trial",
              features: [
                "1 AI visualization per day OR 1 total",
                "Max duration 10-15 min",
                "1-2 ambiences",
                "1 standard voice",
              ],
            ),

            const SizedBox(height: 16),

            // Premium Card
            _buildSelectableCard(
              controller,
              index: 1,
              title: "Premium",
              price: "\$4.99",
              discount: "Save -20%",
              features: [
                "Unlimited access",
                "30 min duration",
                "All ambiences",
                "Premium voices",
                "Save + favorites + full history",
              ],
            ),

            const SizedBox(height: 40),

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
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text(
                  "Continue",
                  style: TextStyle(
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
