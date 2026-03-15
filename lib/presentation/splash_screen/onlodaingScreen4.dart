import 'package:aura/core/routes/app_routes.dart';
import 'package:aura/globelwidgets/custombutton.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../unity/appcolors/appcolors.dart';

class Onlodaingscreen4 extends StatelessWidget {
  const Onlodaingscreen4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 200),
              Center(
                child: Text(
                  'edge_begins_within'.tr,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),

              const SizedBox(height: 24),
              Center(
                child: Text(
                  "aura_mental_performance".tr,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.6,
                  ),
                ),
              ),

              const SizedBox(height: 380),

              Custombutton(
                text: "begin_your_preparation".tr,
                ontap: () {
                  Get.toNamed(AppRoutes.onlodaingscreen5);
                },
                gradient: const LinearGradient(
                  colors: [Color(0xFF4A6CF7), Color(0xFFC159E1)],
                ),
              ),
              const SizedBox(height: 18),

              Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: const TextStyle(height: 1.5),
                    children: [
                      TextSpan(
                        text: "login".tr,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.toNamed(AppRoutes.login);
                          },
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          foreground: Paint()
                            ..shader =
                            LinearGradient(
                              colors: Appgradient.primaryGradient.colors,
                            ).createShader(
                              const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0),
                            ),
                        ),

                      ),


                       TextSpan(

                        text: "orseparator".tr,
                        style: TextStyle(
                          color: Color(0xffDEDEDE),
                          fontSize: 14,
                        ),
                      ),
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.toNamed(AppRoutes.joinuser);
                          },
                        text: "create_account".tr,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          foreground: Paint()
                            ..shader = Appgradient.primaryGradient.createShader(
                              const Rect.fromLTWH(0.0, 0.0, 200.0, 20.0),
                            ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}