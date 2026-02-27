import 'package:aura/globelwidgets/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/routes/app_routes.dart';

class Onlodaingscreen2 extends StatelessWidget {
  const Onlodaingscreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 200),

              const Center(
                child: Text(
                  "Aura is mental",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              const Center(
                child: Text(
                  "performance training.",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 50),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(child: _buildGradientItem("Not meditation")),
                    const SizedBox(width: 20),
                    Expanded(child: _buildGradientItem("Not motivation")),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: _buildGradientItem("Preparation", isFullWidth: true),
              ),

              SizedBox(height: 300),
              // Custombutton(
              //   text: "Continue",
              //   ontap: () {
              //     Get.toNamed(AppRoutes.onlodaingscreen3);
              //   },
              //   gradient: LinearGradient(
              //     colors: [Color(0xFF4A6CF7), Color(0xFFC159E1)],
              //   ),
              // ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGradientItem(String text, {bool isFullWidth = false}) {
    return Column(
      children: [
        Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          height: 1.5,
          width: isFullWidth ? double.infinity : null,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color(0xFF4A6CF7).withValues(alpha: 0.1),
                const Color(0xFFC159E1),
                const Color(0xFF4A6CF7).withValues(alpha: 0.1),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
