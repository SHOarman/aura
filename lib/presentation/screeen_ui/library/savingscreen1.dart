// import 'package:aura/presentation/screeen_ui/library/widget/savingscreen.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_instance/src/extension_instance.dart';
// import 'package:get/get_navigation/src/extension_navigation.dart';
// import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
//
// import '../../../core/services/globelcontroller.dart';
//
// class Savingscreen1 extends StatelessWidget {
//   const Savingscreen1({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final favoriteController = Get.put(Globelcontroller());
//
//     return Scaffold(
//       backgroundColor: Colors.transparent,
//
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsetsGeometry.symmetric(horizontal: 20, ),
//           child: Column(
//             children: [
//
//               const SizedBox(height: 40),
//
//               // --- Custom AppBar Section ---
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   CircleAvatar(
//                     backgroundColor: Colors.white.withOpacity(0.1),
//                     child: IconButton(
//                       icon: const Icon(
//                         Icons.arrow_back_ios_new,
//                         color: Colors.white,
//                         size: 18,
//                       ),
//                       onPressed: () => Get.back(),
//                     ),
//                   ),
//                   Obx(() {
//                     bool active = favoriteController.isFavorite.value;
//                     return GestureDetector(
//                       onTap: () => favoriteController.toggleFavorite(),
//                       child: Container(
//                         padding: const EdgeInsets.all(8),
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           color: Colors.white.withOpacity(0.1),
//                         ),
//                         child: ShaderMask(
//                           shaderCallback: (Rect bounds) {
//                             return LinearGradient(
//                               colors: active
//                                   ? [
//                                 const Color(0xFFD75BE3),
//                                 const Color(0xFF4C65E3),
//                               ]
//                                   : [Colors.white, Colors.white],
//                             ).createShader(bounds);
//                           },
//                           child: Icon(
//                             active ? Icons.favorite : Icons.favorite_border,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     );
//                   }),
//                 ],
//               ),
//
//               SizedBox(height: 40,),
//
//               Savingscreen(title:"Pressure Control" , subTitle: "Prepare your mind before important moments.", category: "Mental Preparation", duration: "10 Min", imagePath: "assets/images/your_image.png")
//
//
//
//
//
//
//
//
//             ],
//           ),
//         )
//         ,
//       ),
//
//     );
//   }
// }
