import 'package:aura/presentation/splash_screen/widgets/gradientdotIcon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/services/globelcontroller.dart';

class Onlodingscreen6 extends StatelessWidget {
  const Onlodingscreen6({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteController = Get.put(Globelcontroller());

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          // image: DecorationImage(
          //   image: AssetImage("assets/images/background_stars.png"),
          //   fit: BoxFit.cover,
          // ),
        ),
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

                // --- Main Image Card ---
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.asset(
                      "assets/images/Frame 1171275468.png",
                      height: 220,
                      width: 300,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                const SizedBox(height: 30),
                Row(
                  crossAxisAlignment: .center,
                  mainAxisAlignment: .center,

                  children: [
                    Text(
                      "5 min",
                      style: TextStyle(
                        color: Color(0xffD9DADB),
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                          letterSpacing: 1.2
                      ),
                    ),
                    SizedBox(width: 4,),
                    //===================doticon===========================
                    
                    GradientDotIcon(),
                    SizedBox(width: 4,),
                    Text("Mental Preparation"
                    ,style: TextStyle(
                        color: Color(0xffD9DADB),
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      letterSpacing: 1.2),)

                  ],
                ),
                SizedBox(height: 20),

                // --- Content Title & Subtitle ---
                const Center(
                  child: Column(
                    children: [
                      Text(
                        "Control confident",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Prepare your mind before important\nmoments.",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Color(0xffF0F0F0), fontSize: 14,fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),

                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('10:42', style: TextStyle(color: Colors.grey)),
                    Text('19:50', style: TextStyle(color: Colors.grey)),
                  ],
                ),

                Center(
                  child: ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return const LinearGradient(
                        colors: [Color(0xFFD75BE3), Color(0xFF4C65E3)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
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

                const SizedBox(height: 10),



                const SizedBox(height: 40),

                // --- Full Player Controls ---
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

                    // Main Play/Pause Button
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
                    // IconButton(
                    //   onPressed: () {},
                    //   icon: const Icon(
                    //     Icons.repeat,
                    //     color: Colors.white54,
                    //     size: 30,
                    //   ),
                    // ),
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
