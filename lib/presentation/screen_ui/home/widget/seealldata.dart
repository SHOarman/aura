// // import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get_connect/http/src/utils/utils.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_navigation/src/extension_navigation.dart';
//
// import '../../../../core/routes/app_routes.dart';
// import '../../screenwidgets/recommended.dart';
//
// class Seealldata extends StatelessWidget {
//   const Seealldata({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.transparent,
//
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         leadingWidth: 70,
//         leading: Padding(
//           padding: const EdgeInsets.only(left: 20, top: 8, bottom: 8),
//           child: Container(
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               color: Colors.white.withValues(alpha: 0.1),
//             ),
//             child: IconButton(
//               onPressed: () => Get.back(),
//               icon: const Icon(
//                 Icons.arrow_back_ios_new_rounded,
//                 color: Colors.white,
//                 size: 18,
//               ),
//             ),
//           ),
//         ),
//         title: const Text(
//           "Popular on Concentrao",
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         centerTitle: true,
//       ),
//
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   GestureDetector(
//                     onTap: (){
//                       debugPrint("filter====================");
//                     },
//                     child: SvgPicture.asset(
//                       "assets/icon/filter.svg",
//                       height: 20,
//                       width: 20,
//                     ),
//                   ),
//                   SizedBox(width: 6),
//                   Text(
//                     "Filter",
//                     style: TextStyle(
//                       color: Color(0xffF0F0F0),
//                       fontWeight: FontWeight.w500,
//                       fontSize: 14,
//                     ),
//                   ),
//                 ],
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const SizedBox(height: 12),
//                   GridView.builder(
//                     shrinkWrap: true,
//                     physics: const NeverScrollableScrollPhysics(),
//                     padding: const EdgeInsets.all(10),
//                     itemCount: 10,
//                     gridDelegate:
//                         const SliverGridDelegateWithFixedCrossAxisCount(
//                           crossAxisCount: 2,
//                           crossAxisSpacing: 10,
//                           mainAxisSpacing: 10,
//                           mainAxisExtent: 220,
//                         ),
//                     itemBuilder: (context, index) {
//                       return liberycard(
//                         imagepagth: 'assets/images/newaa.png',
//                         title: 'Mental Preparation',
//                         ontap: () {
//                           Get.toNamed(
//                             AppRoutes.PrePerformanceFocusDetailsScreen,
//                           );
//                         },
//                       );
//                     },
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

