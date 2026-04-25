// import 'package:concentrao/presentation/screen_ui/library/widget/saving_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../home/widget/recommended_for_you_card.dart';
//
// class SeeAll extends StatelessWidget {
//   const SeeAll({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//       backgroundColor: Colors.transparent,
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: Column(
//
//
//
//             children: [
//
//               SizedBox(height: 60,),
//
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   IconButton(
//                     onPressed: () {
//                       Get.back();
//                     },
//                     icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
//                   ),
//                   const SizedBox(width: 10),
//                   Text(
//                     "My Creation".tr,
//                     style: const TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.w500,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ],
//               ),
//
//               SizedBox(height: 20,),
//
//               Recommendedforyoucard(
//                 title: "Pre-Performance Focus.".tr,
//                 subTitle: "Prepare your mind before important moments.".tr,
//                 category: "mental_preparation".tr,
//                 duration: "duration_15min".tr,
//                 imagePath: "assets/images/Rectangle 19.png",
//                 onTap: () {},
//               ),
//               Recommendedforyoucard(
//                 title: "pre_performance_focus".tr,
//                 subTitle: "Prepare your mind before important moments.".tr,
//                 category: "mental_preparation".tr,
//                 duration: "duration_15min".tr,
//                 imagePath: "assets/images/Rectangle 19.png",
//                 onTap: () {
//                   Get.to(() => SavingScreen(
//                     title: "pre_performance_focus".tr,
//                     subTitle: "prepare_mind_before_moments".tr,
//                     category: "mental_preparation".tr,
//                     duration: "duration_15min".tr,
//                     imagePath: "assets/images/new.png",
//                   ));
//                 },
//               ),
//               Recommendedforyoucard(
//                 title: "Pre-Performance Focus.",
//                 subTitle: "Prepare your mind before important moments.".tr,
//                 category: "mental_preparation".tr,
//                 duration: "duration_15min".tr,
//                 imagePath: "assets/images/Rectangle 19.png",
//                 onTap: () {
//                   Get.to(() => SavingScreen(
//                     title: "pre_performance_focus".tr,
//                     subTitle: "prepare_mind_before_moments".tr,
//                     category: "mental_preparation".tr,
//                     duration: "duration_15min".tr,
//                     imagePath: "assets/images/new.png",
//                   ));
//                 },
//               ),
//               Recommendedforyoucard(
//                 title: "pre_performance_focus".tr,
//                 subTitle: "Prepare your mind before important moments.".tr,
//                 category: "mental_preparation".tr,
//                 duration: "duration_15min".tr,
//                 imagePath: "assets/images/Rectangle 19.png",
//                 onTap: () {
//                   Get.to(() => SavingScreen(
//                     title: "pre_performance_focus".tr,
//                     subTitle: "prepare_mind_before_moments".tr,
//                     category: "mental_preparation".tr,
//                     duration: "duration_15min".tr,
//                     imagePath: "assets/images/new.png",
//                   ));
//                 },
//               ),
//               Recommendedforyoucard(
//                 title: "pre_performance_focus".tr,
//                 subTitle: "Prepare your mind before important moments.".tr,
//                 category: "mental_preparation".tr,
//                 duration: "duration_15min".tr,
//                 imagePath: "assets/images/Rectangle 19.png",
//                 onTap: () {
//                   Get.to(() => SavingScreen(
//                     title: "pre_performance_focus".tr,
//                     subTitle: "prepare_mind_before_moments".tr,
//                     category: "mental_preparation".tr,
//                     duration: "duration_15min".tr,
//                     imagePath: "assets/images/new.png",
//                   ));
//                 },
//               ),
//
//             ],
//
//
//           ),
//         ),
//       ),
//     );
//   }
// }
//
