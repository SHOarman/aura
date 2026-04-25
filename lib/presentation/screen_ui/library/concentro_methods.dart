// import 'package:concentrao/presentation/screen_ui/library/widget/gradient_border_container.dart';
// import 'package:concentrao/presentation/screen_ui/library/widget/saving_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class Concentromethods extends StatelessWidget {
//   const Concentromethods({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     // Note: Removed 'const' from Column to allow .tr and Get.to to work
//     return SingleChildScrollView(
//       physics: const BouncingScrollPhysics(),
//       child: Column(
//         children: [
//           const SizedBox(height: 10),
//
//           // Session 1: Soccer Tournament (Custom)
//           GradientBorderContainer(
//             title: 'soccer_tournament_focus'.tr,
//             subtitle: 'March 22 · 10 min · ${'Custom'.tr}',
//             onTap: () {
//               Get.to(() => SavingScreen(
//                 title: "soccer_tournament_focus".tr,
//                 subTitle: "prepare_mind_before_moments".tr,
//                 category: "mental_preparation".tr,
//                 duration: "10 min",
//                 imagePath: "assets/images/new.png",
//               ));
//             },
//           ),
//
//           const SizedBox(height: 12),
//
//           // Session 2: Pre-Performance Focus
//           GradientBorderContainer(
//             title: 'pre_performance_focus'.tr,
//             subtitle: 'March 20 · 15 min · ${'Generated'.tr}',
//             onTap: () {
//               Get.to(() => SavingScreen(
//                 title: "pre_performance_focus".tr,
//                 subTitle: "prepare_mind_before_moments".tr,
//                 category: "mental_preparation".tr,
//                 duration: "15 min",
//                 imagePath: "assets/images/new.png",
//               ));
//             },
//           ),
//
//           const SizedBox(height: 20),
//         ],
//       ),
//     );
//   }
// }