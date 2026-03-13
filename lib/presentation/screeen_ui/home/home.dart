// import 'package:aura/core/routes/app_routes.dart';
// import 'package:aura/presentation/screeen_ui/home/widget/recommendedforYoucard.dart';
// import 'package:aura/presentation/screeen_ui/screenwidgets/bottomnav_button.dart';
// import 'package:aura/presentation/screeen_ui/screenwidgets/myspace.dart';
// import 'package:aura/presentation/screeen_ui/screenwidgets/recommended.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
//
// class Home extends StatelessWidget {
//   const Home({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: CustomBottomNav(selectIndex: 0),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: Column(
//             crossAxisAlignment: .start,
//             children: [
//               SizedBox(height: 60),
//
//               //==================notification============================================================
//               Row(
//                 mainAxisAlignment: .spaceBetween,
//                 children: [
//                   Image.asset(
//                     "assets/images/image 4.png",
//                     height: 30,
//                     width: 96,
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       // Get.toNamed(AppRoutes.profile);
//                     },
//                     child: Container(
//                       width: 40,
//                       height: 40,
//                       alignment: Alignment.center,
//                       decoration: BoxDecoration(
//                         color: Color(0xFF251D29),
//                         shape: BoxShape.circle,
//                       ),
//                       child: SvgPicture.asset(
//                         "assets/icon/notification.svg",
//                         width: 20,
//                         height: 20,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 40),
//
//               //=====================================================Popular on Aura==================================
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     "Popular on Aura",
//                     style: TextStyle(
//                       color: Color(0xffF0F0F0),
//                       fontWeight: FontWeight.w500,
//                       fontSize: 20,
//                     ),
//                   ),
//
//                   GestureDetector(
//                     onTap: () {
//                      Get.toNamed(AppRoutes.seealldata);
//                     },
//                     child: Text(
//                       "See All",
//                       style: TextStyle(
//                         color: Color(0xffF0F0F0),
//                         fontWeight: FontWeight.w600,
//                         fontSize: 14,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 20),
//
//               //===================================Popular on Aura======================================
//               SizedBox(
//                 height: 244,
//                 child: GridView.builder(
//                   physics: const BouncingScrollPhysics(),
//
//                   scrollDirection: Axis.horizontal,
//
//                   itemCount: 3,
//                   itemBuilder: (context, index) {
//                     return Recommended(
//                       imagepagth: 'assets/images/newadd.png',
//                       title: 'Mental Preparation',
//                       ontap: () {
//                         Get.toNamed(AppRoutes.musicPlayerScreen);
//                       },
//                     );
//                   },
//                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 1,
//                     mainAxisExtent: 200,
//                     crossAxisSpacing: 10,
//                     mainAxisSpacing: 10,
//                   ),
//                 ),
//               ),
//
//               //==================================Recommended for You===============================
//               SizedBox(height: 40),
//               Text(
//                 "Recommended for You",
//                 style: TextStyle(
//                   color: Color(0xffF0F0F0),
//                   fontSize: 20,
//                   fontWeight: FontWeight.w700,
//                 ),
//               ),
//               SizedBox(height: 16),
//
//               Recommendedforyoucard(
//                 title: "Pre-Performance Focus",
//                 subTitle: "Prepare your mind before important\n moments.",
//                 category: "Mental Preparation",
//                 duration: "15min",
//                 imagePath: "assets/images/recomend.png",
//                 onTap: () {
//
//
//                 },
//               ),
//
//               SizedBox(height: 12,),
//
//               Recommendedforyoucard(
//                 title: "Pre-Performance Focus",
//                 subTitle: "Prepare your mind before important\n moments.",
//                 category: "Mental Preparation",
//                 duration: "30min",
//                 imagePath: "assets/images/recomend.png",
//                 onTap: () {
//
//
//                 },
//               ),
//
//               SizedBox(height: 12,),
//
//               Recommendedforyoucard(
//                 title: "Pre-Performance Focus",
//                 subTitle: "Prepare your mind before important\n moments.",
//                 category: "Mental Preparation",
//                 duration: "5min",
//                 imagePath: "assets/images/recomend.png",
//                 onTap: () {
//
//
//                 },
//               ),
//
//               SizedBox(height: 12,),
//               Recommendedforyoucard(
//                 title: "Pre-Performance Focus",
//                 subTitle: "Prepare your mind before important\n moments.",
//                 category: "Mental Preparation",
//                 duration: "20min",
//                 imagePath: "assets/images/recomend.png",
//                 onTap: () {
//
//
//                 },
//               ),
//
//               SizedBox(height: 12,),
//               Recommendedforyoucard(
//                 title: "Pre-Performance Focus",
//                 subTitle: "Prepare your mind before important\n moments.",
//                 category: "Mental Preparation",
//                 duration: "25min",
//                 imagePath: "assets/images/recomend.png",
//                 onTap: () {
//
//
//                 },
//               ),
//
//               SizedBox(height: 12,),
//               Recommendedforyoucard(
//                 title: "Pre-Performance Focus",
//                 subTitle: "Prepare your mind before important\n moments.",
//                 category: "Mental Preparation",
//                 duration: "10min",
//                 imagePath: "assets/images/recomend.png",
//                 onTap: () {
//
//
//                 },
//               ),
//
//               SizedBox(height: 30,),
//
// //=========================================Personalized for You================================
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     "Personalized for You",
//                     style: TextStyle(
//                       color: Color(0xffF0F0F0),
//                       fontWeight: FontWeight.w500,
//                       fontSize: 20,
//                     ),
//                   ),
//
//                   GestureDetector(
//                     onTap: () {
//                       print("see all");
//                     },
//                     child: Text(
//                       "See All",
//                       style: TextStyle(
//                         color: Color(0xffF0F0F0),
//                         fontWeight: FontWeight.w600,
//                         fontSize: 14,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//
//               SizedBox(height: 20,),
//
//
//               SizedBox(
//                 height: 244,
//                 child: GridView.builder(
//                   physics: const BouncingScrollPhysics(),
//
//                   scrollDirection: Axis.horizontal,
//
//                   itemCount: 4,
//                   itemBuilder: (context, index) {
//                     return Recommended(
//                       imagepagth: 'assets/images/ores.png',
//                       title: 'Mental Preparation',
//                       ontap: () {
//                         Get.toNamed(AppRoutes.musicPlayerScreen);
//                       },
//                     );
//                   },
//                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 1,
//                     mainAxisExtent: 200,
//                     crossAxisSpacing: 10,
//                     mainAxisSpacing: 10,
//                   ),
//                 ),
//               ),
//
//
//
//               // Column(
//               //   children: [
//               //     Myspace(
//               //       onTap: () {
//               //         // Get.toNamed(AppRoutes.mycreation);
//               //       },
//               //       text: 'My Creations',
//               //     ),
//               //     Divider(height: 30, color: Color(0xff292B31), thickness: 2),
//               //
//               //     SizedBox(height: 16),
//               //     Myspace(
//               //       onTap: () {
//               //         // Get.toNamed(AppRoutes.favorites);
//               //       },
//               //       text: 'Favorites',
//               //     ),
//               //     Divider(height: 30, color: Color(0xff292B31), thickness: 2),
//               //     SizedBox(height: 16),
//               //     Myspace(
//               //       onTap: () {
//               //         // Get.toNamed(AppRoutes.history);
//               //       },
//               //       text: 'History',
//               //     ),
//               //     Divider(height: 30, color: Color(0xff292B31), thickness: 2),
//               //   ],
//               // ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../../../core/routes/app_routes.dart';
import '../../splash_screen/widgets/preparationCard.dart';
import '../../splash_screen/widgets/quickmentalsessionscard.dart';
import '../screenwidgets/bottomnav_button.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold ke wrap kora Padding shoriye fela hoyeche
    return Scaffold(
      bottomNavigationBar: CustomBottomNav(selectIndex: 0),
      backgroundColor: Colors.black, // Background color set korlam
      body: SingleChildScrollView(
        // Padding ekhon sudhu body content er upor kaj korbe
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 50),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset("assets/images/image 34.png"),
                  GestureDetector(
                    onTap: () {
                      print("Notification Tapped");
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(99),
                        color: const Color(0xff251D29),
                      ),
                      child: Image.asset(
                        "assets/images/mingcute_notification-fill.png",
                        width: 40,
                        height: 40,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),
              const Center(
                child: Text(
                  "Preparation starts now.",
                  style: TextStyle(
                    color: Color(0xffFFFFFF),
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),

              const SizedBox(height: 24),

              PreparationCard(
                ontap: () {
                  Get.toNamed(AppRoutes.onlodaingscreen6);
                },
              ),

              const SizedBox(height: 40),
              const Center(
                child: Text(
                  "Quick Mental Sessions",
                  style: TextStyle(
                    color: Color(0xff8E85A6),
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
              ),
              const SizedBox(height: 24),

              Quickmentalsessionscard(
                ontap: () {
                  Get.toNamed(AppRoutes.preperformanceFocus);
                },
                name: 'Pre-Performance Focus',
              ),

              const SizedBox(height: 10),
              Quickmentalsessionscard(
                  ontap: () {
                    Get.toNamed(AppRoutes.confidencereset);
                  },
                  name: 'Confidence Reset'
              ),
              const SizedBox(height: 10),
              Quickmentalsessionscard(
                  ontap: () {
                    Get.toNamed(AppRoutes.pressurecontrol);
                  },
                  name: 'Pressure Control'
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
