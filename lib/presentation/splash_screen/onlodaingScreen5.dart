import 'package:aura/core/routes/app_routes.dart';
import 'package:aura/presentation/splash_screen/widgets/preparationCard.dart';
import 'package:aura/presentation/splash_screen/widgets/quickmentalsessionscard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Onlodaingscreen5 extends StatelessWidget {
  const Onlodaingscreen5({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Scaffold(
        appBar: AppBar(
          leading: ElevatedButton.icon(
            onPressed: () {
              Get.back();
            },
            label: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 18),
          ),
        ),
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              Text(
                "prep_starts".tr,
                style: const TextStyle(
                  color: Color(0xffFFFFFF),
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),

              const SizedBox(height: 24),

              //====================================PreparationCard===========================================
              PreparationCard(
                ontap: () {
                  Get.toNamed(AppRoutes.onlodaingscreen6);
                },
              ),

              const SizedBox(height: 40),
              Text(
                "quick_sessions".tr,
                style: const TextStyle(
                  color: Color(0xffFFFFFF),
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 24),

              //===========================================Quickmentalsessionscard==================================================//
              Quickmentalsessionscard(
                ontap: () {
                  Get.toNamed(AppRoutes.preperformancefocusdetelsscreen);
                },
                name: 'pre_performance_focus'.tr,
              ),

              const SizedBox(height: 10,),
              Quickmentalsessionscard(
                ontap: () {},
                name: 'confidence_reset'.tr,
              ),
              const SizedBox(height: 10,),
              Quickmentalsessionscard(
                ontap: () {},
                name: 'pressure_control'.tr,
              ),

            ],
          ),
        ),
      ),
    );
  }
}