import 'package:aura/core/routes/app_routes.dart';
import 'package:aura/presentation/screeen_ui/screenwidgets/bottomnav_button.dart';
import 'package:aura/presentation/screeen_ui/screenwidgets/myspace.dart';
import 'package:aura/presentation/screeen_ui/screenwidgets/recommended.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNav(selectIndex: 0),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              SizedBox(height: 60),

              //==================profile============================================================
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Image.asset(
                    "assets/images/image 4.png",
                    height: 30,
                    width: 96,
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
              SizedBox(height: 40),

              Text(
                "Recommended Visualizations",
                style: TextStyle(
                  color: Color(0xffF0F0F0),
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                ),
              ),
              SizedBox(height: 20),

              //===================================Recommended Visualizations======================================
              SizedBox(
                height: 180,
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),

                  scrollDirection: Axis.horizontal,

                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Recommended(
                      imagepagth: 'assets/images/Rectangle 4.png', title: 'Forest Serenity', ontap: () {Get.toNamed(AppRoutes.musicPlayerScreen);  },
                    );
                  },
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisExtent: 170,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 10,
                  ),
                ),
              ),

              //==================================My Space===============================
              SizedBox(height: 40),
              Text(
                "My Space",
                style: TextStyle(
                  color: Color(0xffF0F0F0),
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 16),

              Column(
                children: [
                  Myspace(
                    onTap: () {
                      // Get.toNamed(AppRoutes.mycreation);
                    },
                    text: 'My Creations',
                  ),
                  Divider(height: 30, color: Color(0xff292B31), thickness: 2),

                  SizedBox(height: 16),
                  Myspace(
                    onTap: () {
                      // Get.toNamed(AppRoutes.favorites);
                    },
                    text: 'Favorites',
                  ),
                  Divider(height: 30, color: Color(0xff292B31), thickness: 2),
                  SizedBox(height: 16),
                  Myspace(
                    onTap: () {
                      // Get.toNamed(AppRoutes.history);
                    },
                    text: 'History',
                  ),
                  Divider(height: 30, color: Color(0xff292B31), thickness: 2),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
