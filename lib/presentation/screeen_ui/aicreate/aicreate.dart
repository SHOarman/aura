import 'package:aura/core/routes/app_routes.dart';
import 'package:aura/presentation/screeen_ui/screenwidgets/VisualizationCard.dart';
import 'package:aura/presentation/screeen_ui/screenwidgets/bottomnav_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class Aicreate extends StatelessWidget {
  const Aicreate({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      bottomNavigationBar: CustomBottomNav(selectIndex: 2),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 60),

              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Text(
                    "Create a Visualization",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color(0xffF0F0F0),
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.profile);
                    },
                    child: Image.asset(
                      "assets/images/Ellipse 1.png",
                      height: 50,
                      width: 50,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40),

              Text(
                'Create a personalized mental experience\n to achieve your goals',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Color(0xffF0F0F0),
                ),
              ),
              SizedBox(height: 32),

              VisualizationCard(
                boldtext: "Let AI create my visualization",
                text:
                    "Describe your goal and the AI generates immersive mental coaching with images and audio",
                onTap: () {
                  Get.toNamed(AppRoutes.startwithai);


                },
                iconename: "Start with AI",
              ),

              SizedBox(height: 12,),

              VisualizationCard(
                boldtext: "Write my own visualization",
                text:
                "Write your text and the AI transforms it into audio",
                onTap: () {

                  Get.toNamed(AppRoutes.writemyscript);
                },
                iconename: "Write my script",
              ),

            ],
          ),
        ),
      ),
    );
  }
}
