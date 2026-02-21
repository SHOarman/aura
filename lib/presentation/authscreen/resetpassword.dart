import 'package:aura/core/routes/app_routes.dart';
import 'package:aura/globelwidgets/custombutton.dart';
import 'package:aura/presentation/authscreen/widget/OtpTextFieldWithTimer.dart';
import 'package:aura/presentation/authscreen/widget/customtextfeild.dart';
import 'package:aura/unity/appcolors/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Resetpassword extends StatelessWidget {
  const Resetpassword({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController codeCotroller = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 20),
                    ),
                    const SizedBox(width: 60),
                    const Center(
                      child: Text(
                        "Reset password",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 60),
                CustomTextField(hintText: 'Email', controller: emailController),
                const SizedBox(height: 12),
                OtpTextFieldWithTimer(
                  controller: codeCotroller,
                  onSendCode: () {},
                ),
                const SizedBox(height: 380),
                Custombutton(
                  text: "Continue",
                  ontap: () {
                    Get.toNamed(AppRoutes.newpassword);
                  },
                  gradient: Appgradient.primaryGradient,
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
