import 'package:aura/presentation/screeen_ui/library/widget/CustomGradientButton.dart';
import 'package:aura/presentation/screeen_ui/library/widget/custombox.dart';
import 'package:aura/presentation/screeen_ui/library/widget/savingscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Confidencereinforcement extends StatelessWidget {
  const Confidencereinforcement({super.key});

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
                  Text(
                    "confidence_reinforcement".tr,
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
                  "build_unshakeable_confidence".tr,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ),
              const Divider(color: Colors.white, thickness: 1),

              const SizedBox(height: 10),

              Text(
                "confidence_description".tr,
                style: const TextStyle(
                  color: Color(0xffFFFFFF),
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 32),
              Text(
                "reinforcement_steps".tr,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
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
                              "identify_challenge".tr,
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
                      "write_thoughts_down".tr,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "recognize_doubts".tr,
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
                              "recall_successes".tr,
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
                      "mentally_revisit_moments".tr,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "visualize_past_performances".tr,
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
                              "affirm_strengths".tr,
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
                      "repeat_positive_affirmations".tr,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "affirmation_example".tr,
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
                      title: "confidence_reinforcement".tr,
                      subTitle: "prepare_mind_before_moments".tr,
                      category: "mental_preparation".tr,
                      duration: "ten_min".tr,
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