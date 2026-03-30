import 'package:concentrao/core/routes/app_routes.dart';
import 'package:concentrao/globelwidgets/custombutton.dart';
import 'package:concentrao/presentation/authscreen/widget/customtextfeild.dart';
import 'package:concentrao/unity/appcolors/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Newpassword extends StatefulWidget {
  const Newpassword({super.key});

  @override
  State<Newpassword> createState() => _NewpasswordState();
}

class _NewpasswordState extends State<Newpassword> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController newpasswordController = TextEditingController();
  final TextEditingController confirmpasswordController = TextEditingController();

  @override
  void dispose() {
    newpasswordController.dispose();
    confirmpasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey,
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
                        "new_password".tr,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 60),
                const SizedBox(height: 20),

                CustomTextField(
                  hintText: 'new_password'.tr,
                  controller: newpasswordController,
                  isPassword: true,
                  keyboardType: TextInputType.visiblePassword,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'pwd_required'.tr;
                    }
                    if (value.length < 6) {
                      return 'pwd_min_length'.tr;
                    }
                    return null;
                  },
                ),

                CustomTextField(
                  hintText: 'confirm_password'.tr,
                  controller: confirmpasswordController,
                  isPassword: true,
                  keyboardType: TextInputType.visiblePassword,
                  validator: (value) {
                    if (value != newpasswordController.text) {
                      return 'pwd_mismatch'.tr;
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 420),

                Custombutton(
                  text: "reset_password".tr,
                  gradient: Appgradient.primaryGradient,
                  ontap: () {
                    if (_formKey.currentState!.validate()) {
                      debugPrint("Password logic successful!");
                      Get.toNamed(AppRoutes.login);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
