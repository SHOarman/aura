import 'package:aura/core/routes/app_routes.dart';
import 'package:aura/globelwidgets/custombutton.dart';
import 'package:aura/unity/appcolors/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Joinuser extends StatelessWidget {
  const Joinuser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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
                  "Join millions of user",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(height: 250),

              Custombutton(
                text: "Sign In with Email",
                iconPath: "assets/icon/emailbox.svg",
                ontap: () => print("Email Login"),
                gradient: Appgradient.primaryGradient,
              ),
              const SizedBox(height: 12),

              Custombutton(
                text: "Sign In with Google",
                iconPath: "assets/icon/devicon_google.svg",
                ontap: () => print("Google Login"),
                backgroundColor: const Color(0xff1C1C1C),
              ),
              const SizedBox(height: 12),

              Custombutton(
                text: "Continue with Apple",
                iconPath: "assets/icon/app.svg",
                ontap: () => print("Apple Login"),
                backgroundColor: const Color(0xff1C1C1C),
              ),

              const SizedBox(height: 30),

              GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutes.singup);
                },
                child: ShaderMask(
                  shaderCallback: (bounds) =>
                      Appgradient.primaryGradient.createShader(
                        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                      ),
                  child: Center(
                    child: const Text(
                      "Log in with email",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
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
                      const TextSpan(
                        text: "By continuing you accept the ",
                        style: TextStyle(
                          color: Color(0xffDEDEDE),
                          fontSize: 14,
                        ),
                      ),
                      TextSpan(
                        text: "terms of use",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          foreground: Paint()
                            ..shader = Appgradient.primaryGradient.createShader(
                              const Rect.fromLTWH(0.0, 0.0, 200.0, 20.0),
                            ),
                        ),
                      ),
                      const TextSpan(
                        text: " and\n ",
                        style: TextStyle(
                          color: Color(0xffDEDEDE),
                          fontSize: 14,
                        ),
                      ),
                      TextSpan(
                        text: "privacy policy",
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
