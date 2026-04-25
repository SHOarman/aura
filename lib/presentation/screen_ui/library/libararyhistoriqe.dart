import 'package:concentrao/presentation/screen_ui/library/widget/saving_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home/widget/recommended_for_you_card.dart';

class LibraryHistorique extends StatefulWidget {
  const LibraryHistorique({super.key});

  @override
  State<LibraryHistorique> createState() => _LibraryHistoriqueState();
}

class _LibraryHistoriqueState extends State<LibraryHistorique> {

  int selectedIndex = 0;


  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // Text(
        //   "continue_training".tr,
        //   style: const TextStyle(
        //     color: Colors.white,
        //     fontSize: 18,
        //     fontWeight: FontWeight.w500,
        //   ),
        // ),
        // const SizedBox(height: 16),
        // MethodCard(
        //   onTap: () {
        //     Get.toNamed(AppRoutes.pressureControlDetailsCard);
        //   },
        // ),
        // const SizedBox(height: 24),
        //
        // Center(
        //   child: Row(
        //     mainAxisSize: MainAxisSize.max,
        //     children: [
        //       _navButton("My Creations".tr, 0),
        //       SizedBox(width: 12),
        //       _navButton("Concentro".tr, 1),
        //
        //     ],
        //   ),
        // ),

        // SizedBox(height: 30,),
        // selectedIndex == 0?
        //     Mycreation():
        //     Concentromethods()




        // Text(
        //   'saved_sessions'.tr,
        //   style: const TextStyle(
        //     color: Color(0xffFFFFFF),
        //     fontWeight: FontWeight.w500,
        //     fontSize: 18,
        //   ),
        // ),
        // const SizedBox(height: 12),
        // GradientBorderContainer(
        //   title: 'soccer_tournament_focus'.tr,
        //   subtitle: '15 min · ${'generated_guided'.tr.split(' · ').last}',
        //   onTap: () {
        //     Get.to(() => SavingScreen(
        //       title: "soccer_tournament_focus".tr,
        //       subTitle: "prepare_mind_before_moments".tr,
        //       category: "mental_preparation".tr,
        //       duration: "duration_15min".tr,
        //       imagePath: "assets/images/new.png",
        //     ));
        //   },
        // ),
        // const SizedBox(height: 12),
        // GradientBorderContainer(
        //   title: 'soccer_tournament_focus'.tr,
        //   subtitle: '8 min · Custom'.tr,
        //   onTap: () {
        //     Get.to(() => SavingScreen(
        //       title: "soccer_tournament_focus".tr,
        //       subTitle: "prepare_mind_before_moments".tr,
        //       category: "mental_preparation".tr,
        //       duration: "8 min",
        //       imagePath: "assets/images/new.png",
        //     ));
        //   },
        // ),
        //
        // Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //
        //     Text( "My Creation".tr,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20),),
        //
        //     TextButton(onPressed: (){
        //
        //       Get.toNamed(AppRoutes.seealldata);
        //
        //
        //     }, child: Text("See All".tr,style: TextStyle(),)),
        //
        //   ],
        // ),

        // SizedBox(height: 20,),

        Recommendedforyoucard(
                    title: "pre_performance_focus".tr,
                    subTitle: "Prepare your mind before important moments.".tr,
          // category: "mental_preparation".tr,
                     duration: "duration_15min".tr,
                    imagePath: "assets/images/Rectangle 19.png",
                    onTap: () {

                      Get.to(() => SavingScreen(
                        title: "pre_performance_focus".tr,
                        subTitle: "prepare_mind_before_moments".tr,
                        category: "mental_preparation".tr,
                        duration: "duration_15min".tr,
                        imagePath: "assets/images/new.png",
                      ));
                    },
                   ),

        Recommendedforyoucard(
          title: "pressure_control".tr,
          subTitle: "Prepare your mind before important moments.".tr,
          // category: "mental_preparation".tr,
          duration: "duration_5min".tr,
          imagePath: "assets/images/Rectangle 16 (1).png",
          onTap: () {
            Get.to(() => SavingScreen(
              title: "pressure_control".tr,
              subTitle: "prepare_mind_before_moments".tr,
              category: "mental_preparation".tr,
              duration: "duration_5min".tr,
              imagePath: "assets/images/Rectangle 16 (1).png",
            ));
          },
        ),

        Recommendedforyoucard(
          title: "peak_state_activation".tr,
          subTitle: "Prepare your mind before important moments.".tr,
          // category: "mental_preparation".tr,
          duration: "ten_min".tr,
          imagePath: "assets/images/Rectangle 4.png",
          onTap: () {
            Get.to(() => SavingScreen(
              title: "peak_state_activation".tr,
              subTitle: "prepare_mind_before_moments".tr,
              category: "mental_preparation".tr,
              duration: "ten_min".tr,
              imagePath: "assets/images/Rectangle 4.png",
            ));
          },
        ),

        Recommendedforyoucard(
          title: "confidence_reinforcement".tr,
          subTitle: "Prepare your mind before important moments.".tr,
          // category: "mental_preparation".tr,
          duration: "ten_min".tr,
          imagePath: "assets/images/Rectangle 7.png",
          onTap: () {
            Get.to(() => SavingScreen(
              title: "confidence_reinforcement".tr,
              subTitle: "prepare_mind_before_moments".tr,
              category: "mental_preparation".tr,
              duration: "ten_min".tr,
              imagePath: "assets/images/Rectangle 7.png",
            ));
          },
        ),



        Recommendedforyoucard(
          title: "pre_performance_focus".tr,
          subTitle: "Prepare your mind before important moments.".tr,
          // category: "mental_preparation".tr,
          duration: "duration_15min".tr,
          imagePath: "assets/images/Rectangle 19.png",
          onTap: () {

            Get.to(() => SavingScreen(
              title: "pre_performance_focus".tr,
              subTitle: "prepare_mind_before_moments".tr,
              category: "mental_preparation".tr,
              duration: "duration_15min".tr,
              imagePath: "assets/images/new.png",
            ));
          },
        ),


        // const SizedBox(height: 12),
        // GradientBorderContainer(
        //   title: 'soccer_tournament_focus'.tr,
        //   subtitle: '20 min · ${'generated_guided'.tr.split(' · ').last}',
        //   onTap: () {
        //     Get.to(() => SavingScreen(
        //       title: "soccer_tournament_focus".tr,
        //       subTitle: "prepare_mind_before_moments".tr,
        //       category: "mental_preparation".tr,
        //       duration: "20 min",
        //       imagePath: "assets/images/new.png",
        //     ));
        //   },
        // ),
        // const SizedBox(height: 12),
        // GradientBorderContainer(
        //   title: 'soccer_tournament_focus'.tr,
        //   subtitle: '10 min · Custom'.tr,
        //   onTap: () {
        //     Get.to(() => SavingScreen(
        //       title: "soccer_tournament_focus".tr,
        //       subTitle: "prepare_mind_before_moments".tr,
        //       category: "mental_preparation".tr,
        //       duration: "ten_min".tr,
        //       imagePath: "assets/images/new.png",
        //     ));
        //   },
        // ),
      ],
    );
  }

}
