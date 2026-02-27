import 'package:aura/presentation/splash_screen/onlodingScreen3.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../core/services/globelcontroller.dart';
import '../../globelwidgets/custombutton.dart';
import 'onlodaingscreen2.dart';

class Onlodingscreen extends StatelessWidget {
  const Onlodingscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Globelcontroller controller = Get.put(Globelcontroller());

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.onPageChanged,
            children: [
              _buildFirstPage(),
              Onlodaingscreen2(),
              Onlodingscreen3(),
            ],
          ),

          Positioned(
            bottom: 60,
            left: 20,
            right: 20,
            child: Column(
              children: [
                Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(3, (index) {
                      bool isActive = controller.currentPage.value == index;
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        height: 7,
                        width: isActive ? 24 : 8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          gradient: isActive
                              ? const LinearGradient(
                                  colors: [
                                    Color(0xFF4A6CF7),
                                    Color(0xFFC159E1),
                                  ],
                                )
                              : null,
                          color: isActive ? null : Colors.white,
                        ),
                      );
                    }),
                  ),
                ),

                const SizedBox(height: 40),

                // Continue Button
                Custombutton(
                  text: "Continue",
                  ontap: controller.goToNextPage,
                  gradient: const LinearGradient(
                    colors: [Color(0xFF4A6CF7), Color(0xFFC159E1)],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFirstPage() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 180),
          Text(
            "Before every defining moment,\nthere is preparation.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 20),
          Text(
            "The difference is built in advance.",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }
}
