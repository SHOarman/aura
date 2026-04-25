// import 'package:concentrao/presentation/screen_ui/home/widget/recommended_for_you_card.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
//
// import '../screenwidgets/bottomnav_button.dart';
//
// class Vsualisation extends StatelessWidget {
//   const Vsualisation({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: CustomBottomNav(selectIndex: 1),
//       backgroundColor: Colors.transparent,
//
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 18),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(height: 60),
//               const Center(
//                 child: Text(
//                   "My Creation",
//                   style: TextStyle(
//                     color: Color(0xffFCFDFD),
//                     fontSize: 20,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//               ),
//
//               const SizedBox(height: 30),
//
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Row(
//                     children: [
//                       const Text(
//                         'My Creation',
//                         style: TextStyle(
//                           color: Color(0xffFCFDFD),
//                           fontWeight: FontWeight.w500,
//                           fontSize: 16,
//                         ),
//                       ),
//                       const SizedBox(width: 6),
//                       SvgPicture.asset(
//                         "assets/icon/mdi_music.svg",
//                         color: Colors.white,
//                         height: 20,
//                       ),
//                     ],
//                   ),
//
//                   GestureDetector(
//                     onTap: () {},
//                     child: Row(
//                       children: [
//                         SvgPicture.asset(
//                           "assets/icon/filter.svg",
//                           color: Colors.white,
//                           height: 20,
//                           width: 20,
//                         ),
//                         const SizedBox(width: 6),
//                         const Text(
//                           'Filter',
//                           style: TextStyle(
//                             color: Color(0xffFCFDFD),
//                             fontWeight: FontWeight.w500,
//                             fontSize: 14,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//
//               const SizedBox(height: 20),
//
//               Recommendedforyoucard(
//                 title: "Pre-Performance Focus.",
//                 subTitle: "Prepare your mind before important moments.",
//                 category: "Mental Preparation",
//                 duration: "15min",
//                 imagePath: "assets/images/Rectangle 19.png",
//                 onTap: () {},
//               ),
//               SizedBox(height: 12,),
//               Recommendedforyoucard(
//                 title: "Pre-Performance Focus.",
//                 subTitle: "Prepare your mind before important moments.",
//                 category: "Mental Preparation",
//                 duration: "30min",
//                 imagePath: "assets/images/Rectangle 19 (1).png",
//                 onTap: () {},
//               ),
//               SizedBox(height: 12,),
//               Recommendedforyoucard(
//
//
//                 title: "Pre-Performance Focus.",
//                 subTitle: "Prepare your mind before important moments.",
//                 category: "Mental Preparation",
//                 duration: "15min",
//                 imagePath: "assets/images/Rectangle 19 (2).png",
//                 onTap: () {},
//               ),
//               SizedBox(height: 12,),
//               Recommendedforyoucard(
//                 title: "Pre-Performance Focus.",
//                 subTitle: "Prepare your mind before important moments.",
//                 category: "Mental Preparation",
//                 duration: "20min",
//                 imagePath: "assets/images/Rectangle 19.png",
//                 onTap: () {},
//               ),
//               SizedBox(height: 12,),
//               Recommendedforyoucard(
//                 title: "Pre-Performance Focus.",
//                 subTitle: "Prepare your mind before important moments.",
//                 category: "Mental Preparation",
//                 duration: "15min",
//                 imagePath: "assets/images/Rectangle 19 (2).png",
//                 onTap: () {},
//               ),
//               SizedBox(height: 12,),
//               Recommendedforyoucard(
//                 title: "Pre-Performance Focus.",
//                 subTitle: "Prepare your mind before important moments.",
//                 category: "Mental Preparation",
//                 duration: "10min",
//                 imagePath: "assets/images/Rectangle 19.png",
//                 onTap: () {},
//               ),
//               SizedBox(height: 12,),
//               Recommendedforyoucard(
//                 title: "Pre-Performance Focus.",
//                 subTitle: "Prepare your mind before important moments.",
//                 category: "Mental Preparation",
//                 duration: "5min",
//                 imagePath: "assets/images/Rectangle 19 (1).png",
//                 onTap: () {},
//               ),
//               SizedBox(height: 12,),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

