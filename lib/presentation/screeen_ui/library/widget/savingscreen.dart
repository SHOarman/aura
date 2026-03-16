import 'package:aura/presentation/splash_screen/widgets/gradientdotIcon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/services/globelcontroller.dart';

class Savingscreen extends StatelessWidget {
  final String title;
  final String subTitle;
  final String category;
  final String duration;
  final String imagePath;
  final String startTime;
  final String endTime;

  const Savingscreen({
    super.key,
    required this.title,
    required this.subTitle,
    required this.category,
    required this.duration,
    required this.imagePath,
    this.startTime = "00:00",
    this.endTime = "15:50",
  });

  @override
  Widget build(BuildContext context) {
    final favoriteController = Get.put(Globelcontroller());

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),

                // --- Custom AppBar Section ---
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white.withOpacity(0.1),
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.white,
                          size: 18,
                        ),
                        onPressed: () => Get.back(),
                      ),
                    ),
                    Obx(() {
                      bool active = favoriteController.isFavorite.value;
                      return GestureDetector(
                        onTap: () => favoriteController.toggleFavorite(),
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white.withOpacity(0.1),
                          ),
                          child: ShaderMask(
                            shaderCallback: (Rect bounds) {
                              return LinearGradient(
                                colors: active
                                    ? [
                                        const Color(0xFFD75BE3),
                                        const Color(0xFF4C65E3),
                                      ]
                                    : [Colors.white, Colors.white],
                              ).createShader(bounds);
                            },
                            child: Icon(
                              active ? Icons.favorite : Icons.favorite_border,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      );
                    }),
                  ],
                ),

                const SizedBox(height: 30),

                // --- Dynamic Image Card ---
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.asset(
                      imagePath, // কাস্টম ইমেজ
                      height: 220,
                      width: 300,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      duration,
                      style: const TextStyle(
                        color: Color(0xffD9DADB),
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(width: 6),
                    const GradientDotIcon(),
                    const SizedBox(width: 6),
                    Text(
                      category, // কাস্টম ক্যাটাগরি
                      style: const TextStyle(
                        color: Color(0xffD9DADB),
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // --- Dynamic Text Content ---
                Center(
                  child: Column(
                    children: [
                      Text(
                        title, // কাস্টম টাইটেল
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        subTitle, // কাস্টম বর্ণনা
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Color(0xffF0F0F0),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),

                const Spacer(),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(startTime, style: const TextStyle(color: Colors.grey)),
                    Text(endTime, style: const TextStyle(color: Colors.grey)),
                  ],
                ),

                // Wave/Line Image
                Center(
                  child: ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return const LinearGradient(
                        colors: [Color(0xFFD75BE3), Color(0xFF4C65E3)],
                      ).createShader(bounds);
                    },
                    blendMode: BlendMode.srcIn,
                    child: Image.asset(
                      "assets/images/Line.png",
                      height: 60,
                      width: double.infinity,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),

                const SizedBox(height: 40),

                // Player Controls
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.replay_10,
                        color: Colors.white54,
                        size: 30,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFFD75BE3), Color(0xFF4C65E3)],
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.play_arrow_rounded,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.forward_10,
                        color: Colors.white54,
                        size: 30,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
