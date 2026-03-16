import 'package:aura/core/routes/app_routes.dart';
import 'package:aura/presentation/screeen_ui/library/widget/GradientBorderContainer.dart';
import 'package:aura/presentation/screeen_ui/library/widget/methodcard.dart';
import 'package:aura/presentation/screeen_ui/library/widget/savingscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LibraryHistorique extends StatelessWidget {
  const LibraryHistorique({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text(
          "continue_training".tr,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 16),
        MethodCard(
          onTap: () {
            Get.toNamed(AppRoutes.pressurcontrolecard);
          },
        ),
        const SizedBox(height: 24),
        Text(
          'saved_sessions'.tr,
          style: const TextStyle(
            color: Color(0xffFFFFFF),
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 12),
        GradientBorderContainer(
          title: 'soccer_tournament_focus'.tr,
          subtitle: '15 min · ${'generated_guided'.tr.split(' · ').last}',
          onTap: () {
            Get.to(() => Savingscreen(
              title: "pressure_control".tr,
              subTitle: "prepare_mind_before_moments".tr,
              category: "mental_preparation".tr,
              duration: "duration_15min".tr,
              imagePath: "assets/images/new.png",
            ));
          },
        ),
        const SizedBox(height: 12),
        GradientBorderContainer(
          title: 'soccer_tournament_focus'.tr,
          subtitle: '8 min · Custom',
          onTap: () {
            Get.to(() => Savingscreen(
              title: "pressure_control".tr,
              subTitle: "prepare_mind_before_moments".tr,
              category: "mental_preparation".tr,
              duration: "8 min",
              imagePath: "assets/images/new.png",
            ));
          },
        ),
        const SizedBox(height: 12),
        GradientBorderContainer(
          title: 'soccer_tournament_focus'.tr,
          subtitle: '20 min · ${'generated_guided'.tr.split(' · ').last}',
          onTap: () {
            Get.to(() => Savingscreen(
              title: "pressure_control".tr,
              subTitle: "prepare_mind_before_moments".tr,
              category: "mental_preparation".tr,
              duration: "20 min",
              imagePath: "assets/images/new.png",
            ));
          },
        ),
        const SizedBox(height: 12),
        GradientBorderContainer(
          title: 'soccer_tournament_focus'.tr,
          subtitle: '10 min · Custom',
          onTap: () {
            Get.to(() => Savingscreen(
              title: "pressure_control".tr,
              subTitle: "prepare_mind_before_moments".tr,
              category: "mental_preparation".tr,
              duration: "ten_min".tr,
              imagePath: "assets/images/new.png",
            ));
          },
        ),
      ],
    );
  }
}