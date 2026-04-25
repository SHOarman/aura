import 'package:concentrao/presentation/screen_ui/library/widget/custombox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrePerformancerutine extends StatelessWidget {
  const PrePerformancerutine({super.key});

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
                    "pre_performance_routine".tr,
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
                  "get_ready_to_perform".tr,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ),
              const Divider(color: Colors.white, thickness: 1),


              Text(
                "optimal_performance_routine".tr,
                style: const TextStyle(
                  color: Color(0xffFFFFFF),
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 32),
              Text(
                "preparation_steps".tr,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                ),
              ),

              const SizedBox(height: 22),

              // Step 1: Ground
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
                              "ground".tr,
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
                      "sit_comfortably".tr,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "breathe_deeply".tr,
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

              // Step 2: Intensify
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
                              "intensify".tr,
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
                    const SizedBox(height: 8),
                    Text(
                      "elevate_metal_excitement".tr,
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

              // Step 3: Channel
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
                              "channel".tr,
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
                      "direct_energy_powards_task".tr,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "visualize_success_madane".tr,
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

              // const SizedBox(height: 30),
              //
              // CustomGradientButton(
              //     text: "begin_routine".tr,
              //     onPressed: () {
              //       Get.to(() => SavingScreen(
              //         title: "pre_performance_routine".tr,
              //         subTitle: "prepare_mind_before_moments".tr,
              //         category: "mental_preparation".tr,
              //         duration: "duration_5min".tr,
              //         imagePath: "assets/images/new.png",
              //       ));
              //     }),

              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }
}
