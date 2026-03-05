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
              Center(
                child: Text(
                  "Creation audio",
                  style: TextStyle(
                    color: Color(0xffFCFDFD),
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: 24),

              VisualizationCard(
                boldText: 'Let AI create my visualization',
                descriptionText:
                    'Describe your goal and the AI generates immersive mental coaching with audio',
                buttonLabel: 'Guide by Aura',
                onTap: () {

                  Get.toNamed(AppRoutes.createScriptScreen);
                },
              ),

              SizedBox(height: 12),


              VisualizationCard(
                boldText: 'Write my own visualization',
                descriptionText:
                'Write your text and AI transforms it into audio',
                buttonLabel: 'Write your own Script',
                onTap: () {
                },
              ),

              // VisualizationCard(
              //   boldtext: "Write my own visualization",
              //   text: "Write your text and the AI transforms it into audio",
              //   onTap: () {
              //     Get.toNamed(AppRoutes.writemyscript);
              //   },
              //   iconename: "Write my script",
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
