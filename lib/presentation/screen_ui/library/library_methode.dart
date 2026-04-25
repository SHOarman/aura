import 'package:concentrao/core/routes/app_routes.dart';
import 'package:concentrao/presentation/screen_ui/library/widget/theconcentraoframework.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Librarymethode extends StatelessWidget {
  const Librarymethode({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "the_concentrao_framework".tr,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 16),

          //============================== The Concentrao Framework Cards ===========================
          Theconcentraoframework(
            title: 'pre_performance_routine'.tr,
            bulletPoints: [
              'prepare_specific_event'.tr,
              'reduce_uncertainty'.tr,
              'structured_mental_simulation'.tr,
            ],
            onTap: () {
              Get.toNamed(AppRoutes.librarydetails4);
            },
          ),

          const SizedBox(height: 16),
          Theconcentraoframework(
            title: 'confidence_reinforcement'.tr,
            bulletPoints: [
              'identity_reinforcement'.tr,
              'doubt_neutralization'.tr,
              'internal_consolidation'.tr,
            ],
            onTap: () {
              Get.toNamed(AppRoutes.librarydetails);
            },
          ),

          const SizedBox(height: 16),
          Theconcentraoframework(
            title: 'pressure_control'.tr,
            bulletPoints: [
              'respiratory_regulation'.tr,
              'physiological_mastery'.tr,
              'stabilization_under_tension'.tr,
            ],
            onTap: () {
              Get.toNamed(AppRoutes.librarydetails2);
            },
          ),

          const SizedBox(height: 20),
          Theconcentraoframework(
            title: 'peak_state_activation'.tr,
            bulletPoints: [
              'energize'.tr,
              'intensify'.tr,
              'channel'.tr,
            ],
            onTap: () {
              Get.toNamed(AppRoutes.librarydetails3);
            },
          ),
        ],
      ),
    );
  }
}
