import 'package:aura/core/routes/app_routes.dart';
import 'package:aura/presentation/screeen_ui/screenwidgets/VisualizationCard.dart';
import 'package:aura/presentation/screeen_ui/screenwidgets/bottomnav_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Aicreate extends StatelessWidget {
  const Aicreate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Keep background transparent or set a solid color if needed
      backgroundColor: Colors.transparent,
      bottomNavigationBar: CustomBottomNav(selectIndex: 2),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 60),

              Row(
                children: [
                  Image.asset(
                    "assets/images/image 34.png",
                    height: 40, // Added height for consistency
                    width: 40,
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Text(
                      "Creation audio".tr,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Color(0xffFCFDFD),
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 40),

              VisualizationCard(
                boldText: 'Let AI create my visualization'.tr,
                descriptionText:
                'Describe your goal and the AI generates immersive mental coaching with audio'.tr,
                buttonLabel: 'Guide by Aura'.tr,
                onTap: () {
                  Get.toNamed(AppRoutes.auraScriptCreator);
                },
              ),

              const SizedBox(height: 22),

              VisualizationCard(
                boldText: 'Write my own visualization'.tr,
                descriptionText:
                'Write your text and AI transforms it into audio'.tr,
                buttonLabel: 'Write your own Script'.tr,
                onTap: () {
                  Get.toNamed(AppRoutes.aicreatemusicplayer);
                },
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}