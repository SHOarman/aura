import 'package:aura/core/routes/app_routes.dart';
import 'package:aura/presentation/screeen_ui/home/widget/recommendedforYoucard.dart';
import 'package:aura/presentation/screeen_ui/screenwidgets/bottomnav_button.dart';
import 'package:aura/presentation/screeen_ui/screenwidgets/myspace.dart';
import 'package:aura/presentation/screeen_ui/screenwidgets/recommended.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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

              //==================notification============================================================
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
                      // Get.toNamed(AppRoutes.profile);
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Color(0xFF251D29),
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset(
                        "assets/icon/notification.svg",
                        width: 20,
                        height: 20,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40),

              //=====================================================Popular on Aura==================================
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Popular on Aura",
                    style: TextStyle(
                      color: Color(0xffF0F0F0),
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                     Get.toNamed(AppRoutes.seealldata);
                    },
                    child: Text(
                      "See All",
                      style: TextStyle(
                        color: Color(0xffF0F0F0),
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),

              //===================================Popular on Aura======================================
              SizedBox(
                height: 244,
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),

                  scrollDirection: Axis.horizontal,

                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Recommended(
                      imagepagth: 'assets/images/newadd.png',
                      title: 'Mental Preparation',
                      ontap: () {
                        Get.toNamed(AppRoutes.musicPlayerScreen);
                      },
                    );
                  },
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisExtent: 200,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                ),
              ),

              //==================================Recommended for You===============================
              SizedBox(height: 40),
              Text(
                "Recommended for You",
                style: TextStyle(
                  color: Color(0xffF0F0F0),
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 16),

              Recommendedforyoucard(
                title: "Pre-Performance Focus",
                subTitle: "Prepare your mind before important\n moments.",
                category: "Mental Preparation",
                duration: "15min",
                imagePath: "assets/images/recomend.png",
                onTap: () {


                },
              ),

              SizedBox(height: 12,),

              Recommendedforyoucard(
                title: "Pre-Performance Focus",
                subTitle: "Prepare your mind before important\n moments.",
                category: "Mental Preparation",
                duration: "30min",
                imagePath: "assets/images/recomend.png",
                onTap: () {


                },
              ),

              SizedBox(height: 12,),

              Recommendedforyoucard(
                title: "Pre-Performance Focus",
                subTitle: "Prepare your mind before important\n moments.",
                category: "Mental Preparation",
                duration: "5min",
                imagePath: "assets/images/recomend.png",
                onTap: () {


                },
              ),

              SizedBox(height: 12,),
              Recommendedforyoucard(
                title: "Pre-Performance Focus",
                subTitle: "Prepare your mind before important\n moments.",
                category: "Mental Preparation",
                duration: "20min",
                imagePath: "assets/images/recomend.png",
                onTap: () {


                },
              ),

              SizedBox(height: 12,),
              Recommendedforyoucard(
                title: "Pre-Performance Focus",
                subTitle: "Prepare your mind before important\n moments.",
                category: "Mental Preparation",
                duration: "25min",
                imagePath: "assets/images/recomend.png",
                onTap: () {


                },
              ),

              SizedBox(height: 12,),
              Recommendedforyoucard(
                title: "Pre-Performance Focus",
                subTitle: "Prepare your mind before important\n moments.",
                category: "Mental Preparation",
                duration: "10min",
                imagePath: "assets/images/recomend.png",
                onTap: () {


                },
              ),

              SizedBox(height: 30,),

//=========================================Personalized for You================================
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Personalized for You",
                    style: TextStyle(
                      color: Color(0xffF0F0F0),
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      print("see all");
                    },
                    child: Text(
                      "See All",
                      style: TextStyle(
                        color: Color(0xffF0F0F0),
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20,),


              SizedBox(
                height: 244,
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),

                  scrollDirection: Axis.horizontal,

                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Recommended(
                      imagepagth: 'assets/images/ores.png',
                      title: 'Mental Preparation',
                      ontap: () {
                        Get.toNamed(AppRoutes.musicPlayerScreen);
                      },
                    );
                  },
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisExtent: 200,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                ),
              ),



              // Column(
              //   children: [
              //     Myspace(
              //       onTap: () {
              //         // Get.toNamed(AppRoutes.mycreation);
              //       },
              //       text: 'My Creations',
              //     ),
              //     Divider(height: 30, color: Color(0xff292B31), thickness: 2),
              //
              //     SizedBox(height: 16),
              //     Myspace(
              //       onTap: () {
              //         // Get.toNamed(AppRoutes.favorites);
              //       },
              //       text: 'Favorites',
              //     ),
              //     Divider(height: 30, color: Color(0xff292B31), thickness: 2),
              //     SizedBox(height: 16),
              //     Myspace(
              //       onTap: () {
              //         // Get.toNamed(AppRoutes.history);
              //       },
              //       text: 'History',
              //     ),
              //     Divider(height: 30, color: Color(0xff292B31), thickness: 2),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
