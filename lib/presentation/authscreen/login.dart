import 'package:aura/core/routes/app_routes.dart';
import 'package:aura/globelwidgets/custombutton.dart';
import 'package:aura/presentation/authscreen/widget/customtextfeild.dart';
import 'package:aura/unity/appcolors/appcolors.dart';
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
              SizedBox(height: 60),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,

                children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                  ),
                  SizedBox(width: 60),
                  Center(
                    child: Text(
                      "Sign up with email",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 60),

              CustomTextField(
                hintText: 'Name',
                controller: nameController,
                keyboardType: TextInputType.name,
              ),
              CustomTextField(
                hintText: 'Password',
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

              // SizedBox(height: 12),
              GestureDetector(
                onTap: () {

                  Get.toNamed(AppRoutes.forgotpassword);

                },
                child: Text(
                  "Forgotten password?",
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
              SizedBox(height: 12),
              Custombutton(
                text: 'Log in',
                ontap: () {
                Get.toNamed(AppRoutes.home);
                },
                gradient: Appgradient.primaryGradient,
              ),
              SizedBox(height: 320),

              Center(
                child: Text(
                  "New to Aura",
                  style: TextStyle(
                    color: Color(0xffEBEBEB),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),

              SizedBox(height: 12),

              GestureDetector(
                onTap: () {

                  Get.toNamed(AppRoutes.singup);


                },
                child: Center(
                  child: Text(
                    'Create account',
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
