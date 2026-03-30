import 'package:concentrao/core/routes/app_routes.dart';
import 'package:concentrao/globelwidgets/custombutton.dart';
import 'package:concentrao/presentation/authscreen/widget/customtextfeild.dart';
import 'package:concentrao/unity/appcolors/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
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
                  const SizedBox(width: 60),
                  Center(
                    child: Text(
                      "sign_up_with_email".tr,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 60),

              CustomTextField(
                hintText: 'name'.tr,
                controller: nameController,
                keyboardType: TextInputType.name,
              ),
              CustomTextField(
                hintText: 'password'.tr,
                controller: passwordController,
                isPassword: true,
                keyboardType: TextInputType.visiblePassword,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter password';
                  }
                  return null;
                },
              ),

              GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutes.forgotpassword);
                },
                child: Text(
                  "Forgot password".tr,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    foreground: Paint()
                      ..shader = Appgradient.primaryGradient.createShader(
                        const Rect.fromLTWH(0.0, 0.0, 200.0, 20.0),
                      ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Custombutton(
                text: 'login'.tr,
                ontap: () {
                  Get.toNamed(AppRoutes.home);
                },
                gradient: Appgradient.primaryGradient,
              ),
              const SizedBox(height: 320),

              Center(
                child: Text(
                  "new_to_concentrao".tr,
                  style: const TextStyle(
                    color: Color(0xffEBEBEB),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),

              const SizedBox(height: 12),

              GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutes.singup);
                },
                child: Center(
                  child: Text(
                    'create_account'.tr,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      foreground: Paint()
                        ..shader = Appgradient.primaryGradient.createShader(
                          const Rect.fromLTWH(0.0, 0.0, 200.0, 20.0),
                        ),
                    ),
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
