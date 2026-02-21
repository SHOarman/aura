import 'package:aura/core/routes/app_routes.dart';
import 'package:aura/presentation/screeen_ui/screenwidgets/bottomnav_button.dart';
import 'package:aura/presentation/screeen_ui/screenwidgets/recommended.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class Vsualisation extends StatelessWidget {
  const Vsualisation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNav(selectIndex: 1),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 60),
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Text(
                    "Visualization",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color(0xffF0F0F0),
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.profile);
                    },
                    child: Image.asset(
                      "assets/images/Ellipse 1.png",
                      height: 50,
                      width: 50,
                    ),
                  ),
                ],
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 32),

                  TextField(
                    decoration: InputDecoration(
                      focusColor: Color(0xff21242A),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(99),
                      ),
                      fillColor: Color(0xff292B31),
                      filled: true,
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Search',

                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(99),
                      ),

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(99),
                      ),
                    ),
                  ),

                  SizedBox(height: 16),
                  Text(
                    "My Library",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Color(0xffF0F0F0),
                    ),
                  ),

                  SizedBox(height: 12),

                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(10),
                    itemCount: 10,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 10,
                          mainAxisExtent: 180,
                        ),
                    itemBuilder: (context, index) {
                      return Recommended(
                        imagepagth: 'assets/images/Rectangle 4.png',
                        title: 'Forest Serenity',
                        ontap: () {
                          Get.toNamed(AppRoutes.musicPlayerScreen);
                        },
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
