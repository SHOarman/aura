import 'package:aura/core/routes/app_routes.dart';
import 'package:aura/globelwidgets/custombutton.dart';
import 'package:aura/presentation/authscreen/widget/customtextfeild.dart';
import 'package:aura/unity/appcolors/appcolors.dart';
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
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey,
            child: Column(
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
                        "New password",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 60),

                const SizedBox(height: 20),

                CustomTextField(
                  hintText: 'New password',
                  controller: newpasswordController,
                  isPassword: true,
                  keyboardType: TextInputType.visiblePassword,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a password';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),


                CustomTextField(
                  hintText: 'Confirm password',
                  controller: confirmpasswordController,
                  isPassword: true,
                  keyboardType: TextInputType.visiblePassword,
                  validator: (value) {
                    if (value != newpasswordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 420),

                Custombutton(
                  text: "Update Password",
                  gradient: Appgradient.primaryGradient,
                  ontap: () {
                    Get.toNamed(AppRoutes.login);

                    if (_formKey.currentState!.validate()) {
                      print("Password logic successful!");
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