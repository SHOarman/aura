import 'package:aura/presentation/screeen_ui/library/widget/CustomGradientButton.dart';
import 'package:aura/presentation/screeen_ui/library/widget/custombox.dart';
import 'package:aura/presentation/screeen_ui/library/widget/savingscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Pressurcontroller extends StatelessWidget {
  const Pressurcontroller({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 60),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "pressure_control".tr,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              Center(
                child: Text(
                  "stay_composed_under_pressure".tr,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ),
              const Divider(color: Colors.white, thickness: 1),

              Text(
                "confidence_description".tr,
                style: const TextStyle(
                  color: Color(0xffFFFFFF),
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 22),

              // Step 1
              CustomGradientBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "1",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 48,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          const VerticalDivider(
                            color: Colors.white54,
                            thickness: 1.5,
                            indent: 8,
                            endIndent: 8,
                            width: 30,
                          ),
                          Expanded(
                            child: Text(
                              "breath_challenge".tr,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "utilize_breathing".tr,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "practice_box_breathing".tr,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Step 2
              CustomGradientBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "2",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 48,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          const VerticalDivider(
                            color: Colors.white54,
                            thickness: 1.5,
                            indent: 8,
                            endIndent: 8,
                            width: 30,
                          ),
                          Expanded(
                            child: Text(
                              "pressure_release".tr,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "transform_pressures_into_focus".tr,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "channel_nervousness".tr,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "visualize_pressure_as_surge".tr,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // Step 3
              CustomGradientBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "3",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 48,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          const VerticalDivider(
                            color: Colors.white54,
                            thickness: 1.5,
                            indent: 8,
                            endIndent: 8,
                            width: 30,
                          ),
                          Expanded(
                            child: Text(
                              "stabilize".tr,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "stay_mentally_anchored".tr,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "recall_preparations".tr,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/Icon.png",
                      height: 20,
                      width: 20,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      "recommended_duration".tr,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              CustomGradientButton(
                  text: "begin_routine".tr,
                  onPressed: () {
                    Get.to(() => Savingscreen(
                      title: "pressure_control".tr,
                      subTitle: "prepare_mind_before_moments".tr,
                      category: "mental_preparation".tr,
                      duration: "duration_5min".tr,
                      imagePath: "assets/images/new.png",
                    ));
                  }),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}