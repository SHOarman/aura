import 'package:concentrao/core/routes/app_routes.dart';
import 'package:concentrao/globelwidgets/custombutton.dart';
import 'package:concentrao/unity/appcolors/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class JoinUser extends StatelessWidget {
  const JoinUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 80),

              Center(
                child: Text(
                  "Begin your preparation".tr,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(height: 250),

              Custombutton(
                text: "continue_with_email".tr,
                iconPath: "assets/icon/emailbox.svg",
                ontap: () {
                  Get.toNamed(AppRoutes.singup);

                },
                gradient: Appgradient.primaryGradient,
              ),
              const SizedBox(height: 12),

              Custombutton(
                text: "continue_with_google".tr,
                iconPath: "assets/icon/devicon_google.svg",
                ontap: () => debugPrint("Google Login"),
                backgroundColor: const Color(0xff1C1C1C),
              ),
              const SizedBox(height: 12),

              Custombutton(
                text: "continue_with_apple".tr,
                iconPath: "assets/icon/app.svg",
                ontap: () => debugPrint("Apple Login"),
                backgroundColor: const Color(0xff1C1C1C),
              ),

              const SizedBox(height: 30),

              Center(
                child: RichText(
                  text: TextSpan(
                    children: [
                      // ১. সাধারণ টেক্সট (এটি ক্লিকযোগ্য নয়)
                      TextSpan(
                        text: "${"already_have_account".tr} ",
                        style: const TextStyle(
                          color: Colors.white, // সাধারণ সাদা টেক্সট
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      // ২. শুধুমাত্র "Login" অংশটি ক্লিকযোগ্য এবং গ্রেডিয়েন্ট
                      WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: GestureDetector(
                          onTap: () {
                            HapticFeedback.lightImpact(); // প্রিমিয়াম ভাইব্রেশন
                            Get.toNamed(AppRoutes.login);
                          },
                          child: ShaderMask(
                            shaderCallback: (bounds) => Appgradient.primaryGradient.createShader(
                              Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                            ),
                            child: Text(
                              "login".tr,
                              style: const TextStyle(
                                color: Colors.white, // ShaderMask এর জন্য সাদা থাকতে হবে
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline, // ইউজারকে বোঝানোর জন্য আন্ডারলাইন
                                decorationColor: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 140),

              Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: const TextStyle(height: 1.5),
                    children: [
                      TextSpan(
                        text: "${"by_continuing_you_accept".tr} ",
                        style: const TextStyle(
                          color: Color(0xffDEDEDE),
                          fontSize: 14,
                        ),
                      ),
                      TextSpan(
                        text: "terms_of_use".tr,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          foreground: Paint()
                            ..shader = Appgradient.primaryGradient.createShader(
                              const Rect.fromLTWH(0.0, 0.0, 200.0, 20.0),
                            ),
                        ),
                      ),
                      TextSpan(
                        text: " ${"and".tr}\n ",
                        style: const TextStyle(
                          color: Color(0xffDEDEDE),
                          fontSize: 14,
                        ),
                      ),
                      TextSpan(
                        text: "privacy_policy".tr,
                        style: TextStyle(
                          fontSize: 14,
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
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
