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

        Recommendedforyoucard(
                    title: "pre_performance_focus".tr,
                    subTitle: "now you are done ",
                     duration: "duration_15min".tr,
                    imagePath: "assets/images/Rectangle 19.png",
                    onTap: () {

                      Get.to(() => SavingScreen(
                        title: "",
                        subTitle: "now you are done ",
                        category: "pre_performance_focus".tr,
                        duration: "duration_15min".tr,
                        imagePath: "assets/images/new.png",
                      ));
                    },
                   ),

        Recommendedforyoucard(
          title: "pressure_control".tr,
          subTitle: "Best App in the world",
          // category: "mental_preparation".tr,
          duration: "duration_5min".tr,
          imagePath: "assets/images/Rectangle 16 (1).png",
          onTap: () {
            Get.to(() => SavingScreen(
              title: "".tr,
              subTitle: "Best App in the world".tr,
              category: "pressure_control".tr,
              duration: "duration_5min".tr,
              imagePath: "assets/images/Rectangle 16 (1).png",
            ));
          },
        ),

        Recommendedforyoucard(
          title: "peak_state_activation".tr,
          subTitle: "All Done ".tr,
          duration: "ten_min".tr,
          imagePath: "assets/images/Rectangle 4.png",
          onTap: () {
            Get.to(() => SavingScreen(
              title: "".tr,
              subTitle: "All Done".tr,
              category: "peak_state_activation".tr,
              duration: "ten_min".tr,
              imagePath: "assets/images/Rectangle 4.png",
            ));
          },
        ),

        Recommendedforyoucard(
          title: "confidence_reinforcement".tr,
          subTitle: "i like this app".tr,
          // category: "mental_preparation".tr,
          duration: "ten_min".tr,
          imagePath: "assets/images/Rectangle 7.png",
          onTap: () {
            Get.to(() => SavingScreen(
              title: "".tr,
              subTitle: "i like this app".tr,
              category: "confidence_reinforcement".tr,
              duration: "ten_min".tr,
              imagePath: "assets/images/Rectangle 7.png",
            ));
          },
        ),



        Recommendedforyoucard(
          title: "pre_performance_focus".tr,
          subTitle: "App look is Premium".tr,
          // category: "mental_preparation".tr,
          duration: "duration_15min".tr,
          imagePath: "assets/images/Rectangle 19.png",
          onTap: () {

            Get.to(() => SavingScreen(
              title: "".tr,
              subTitle: "App look is Premium".tr,
              category: "pre_performance_focus".tr,
              duration: "duration_15min".tr,
              imagePath: "assets/images/new.png",
            ));
          },
        ),

      ],
    );
  }

}
