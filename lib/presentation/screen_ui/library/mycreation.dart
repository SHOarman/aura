// import 'package:concentrao/presentation/screen_ui/library/widget/gradient_border_container.dart';
// import 'package:concentrao/presentation/screen_ui/library/widget/saving_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../../core/routes/app_routes.dart';
// import '../home/widget/recommended_for_you_card.dart';
//
// class Mycreation extends StatelessWidget {
//   const Mycreation({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       physics: const BouncingScrollPhysics(),
//       padding: const EdgeInsets.symmetric(horizontal: 4),
//       child: Column(
//         children: [
//
//
//
//
//      Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//
//               Text( "My Creation".tr,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20),),
//
//               TextButton(onPressed: (){
//
//                 Get.toNamed(AppRoutes.seealldata);
//
//
//               }, child: Text("See All".tr,style: TextStyle(),)),
//
//             ],
//           ),
//
//           SizedBox(height: 20,),
//
//           Recommendedforyoucard(
//                       title: "pre_performance_focus".tr,
//                       subTitle: "Prepare your mind before important moments.".tr,
//             category: "mental_preparation".tr,
//                        duration: "duration_15min".tr,
//                       imagePath: "assets/images/Rectangle 19.png",
//                       onTap: () {
//
//                         Get.to(() => SavingScreen(
//                           title: "pre_performance_focus".tr,
//                           subTitle: "prepare_mind_before_moments".tr,
//                           category: "mental_preparation".tr,
//                           duration: "duration_15min".tr,
//                           imagePath: "assets/images/new.png",
//                         ));
//                       },
//                      ),
//
//
//
//           SizedBox(height: 20),
//           Recommendedforyoucard(
//             title: "pre_performance_focus".tr,
//             subTitle: "Prepare your mind before important moments.".tr,
//             category: "mental_preparation".tr,
//             duration: "duration_15min".tr,
//             imagePath: "assets/images/Rectangle 19.png",
//             onTap: () {
//               Get.to(() => SavingScreen(
//                 title: "pre_performance_focus".tr,
//                 subTitle: "prepare_mind_before_moments".tr,
//                 category: "mental_preparation".tr,
//                 duration: "duration_15min".tr,
//                 imagePath: "assets/images/new.png",
//               ));
//             },
//           ),
//
//         ],
//       ),
//     );
//   }
// }