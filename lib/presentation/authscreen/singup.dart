import 'package:concentrao/core/routes/app_routes.dart';
import 'package:concentrao/globelwidgets/custombutton.dart';
import 'package:concentrao/presentation/authscreen/widget/customtextfeild.dart';
import 'package:concentrao/unity/appcolors/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Singup extends StatelessWidget {
  const Singup({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
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
                      "Sing in with email",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 60),
              CustomTextField(
                hintText: "name".tr,
                controller: nameController,
                keyboardType: TextInputType.name,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'name_required'.tr;
                  }
                  return null;
                },
              ),
              CustomTextField(
                hintText: "email".tr,
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'email_required'.tr;
                  }
                  return null;
                },
              ),
              CustomTextField(
                hintText: "password".tr,
                controller: passwordController,
                keyboardType: TextInputType.visiblePassword,
                isPassword: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'pwd_enter'.tr;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),

              Custombutton(
                text: 'create_account'.tr,
                ontap: () {
                  Get.toNamed(AppRoutes.login);
                },
                gradient: Appgradient.primaryGradient,
              ),

              const SizedBox(height: 300),

              Center(
                child: Text(
                  "already_have_account".tr,
                  style: const TextStyle(
                    color: Color(0xffEBEBEB),
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutes.login);
                },
                child: Text(
                  'login'.tr,
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
            ],
          ),
        ),
      ),
    );
  }
}
