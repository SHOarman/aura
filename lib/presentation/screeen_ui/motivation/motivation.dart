import 'package:aura/presentation/screeen_ui/motivation/widget/Custom%20Motivation%20Card%20Widget.dart';
import 'package:aura/presentation/screeen_ui/screenwidgets/bottomnav_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import '../../../core/routes/app_routes.dart';

class Motivation extends StatelessWidget {
  const Motivation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      bottomNavigationBar: const CustomBottomNav(selectIndex: 3),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 60),

              // Header: Title and Profile
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Motivation",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Color(0xffF0F0F0),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.profile);
                    },
                    child: CircleAvatar(
                      radius: 25,
                      backgroundImage: const AssetImage(
                        "assets/images/Ellipse 1.png",
                      ),
                      backgroundColor: Colors.grey[800],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // ========================= Motivation Card ============================
              Stack(
                alignment: Alignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      "assets/images/Rectangle 7.png",
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      "Success comes to those who\ndare to dream and\npersevere.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            blurRadius: 10.0,
                            color: Colors.black.withOpacity(0.5),
                            offset: const Offset(2, 2),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 36),

              // ========================= Vision Board Section =========================
              const Text(
                "Vision Board",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Color(0xffF0F0F0),
                ),
              ),
              const SizedBox(height: 16),

              // ========================= Vision Board Section =========================
              Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Image.asset(
                        "assets/images/Rectangle 8.png",
                        height: 105,

                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    flex: 7,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Image.asset(
                        "assets/images/Rectangle 9.png",
                        height: 105,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Image.asset(
                        "assets/images/Rectangle 12.png",
                        height: 105,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    flex: 6,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Image.asset(
                        "assets/images/Rectangle 10.png",
                        height: 105,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    flex: 3,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Image.asset(
                        "assets/images/Rectangle 11.png",
                        height: 105,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 40),
              buildMotivationCard(
                title: 'Achieve My Goals',
                bgImage: 'assets/images/Rectangle 16.png',
              ),
              SizedBox(height: 8),
              buildMotivationCard(
                title: 'Confidence and Success',
                bgImage: 'assets/images/Rectangle 16 (1).png',
              ),
              SizedBox(height: 8),
              buildMotivationCard(
                title: 'Motivated in 2 Minutes',
                bgImage: 'assets/images/Rectangle 16 (2).png',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
