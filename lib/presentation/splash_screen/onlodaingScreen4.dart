import 'package:aura/globelwidgets/custombutton.dart';
import 'package:flutter/material.dart';

import '../../unity/appcolors/appcolors.dart';

class Onlodaingscreen4 extends StatelessWidget {
  const Onlodaingscreen4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 200),
              Center(
                child: Text(
                  'The Edge Begins Within.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),

              SizedBox(height: 24),
              Center(
                child: Text(
                  "Train your mind with the same discipline",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.6,
                  ),
                ),
              ),
              Center(
                child: Text(
                  "you train your craft.",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.6,
                  ),
                ),
              ),

              SizedBox(height: 380),

              Custombutton(
                text: "Begin Training",
                ontap: () {},
                gradient: LinearGradient(
                  colors: [Color(0xFF4A6CF7), Color(0xFFC159E1)],
                ),
              ),
              SizedBox(height: 18),

              Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: const TextStyle(height: 1.5),
                    children: [
                      TextSpan(
                        text: "Sing in",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          foreground: Paint()
                            ..shader =
                                LinearGradient(
                                  colors: Appgradient.primaryGradient.colors,
                                ).createShader(
                                  const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0),
                                ),
                        ),
                      ),

                      const TextSpan(
                        text: " 0r ",
                        style: TextStyle(
                          color: Color(0xffDEDEDE),
                          fontSize: 14,
                        ),
                      ),
                      TextSpan(
                        text: "Creatae  account",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          foreground: Paint()
                            ..shader = Appgradient.primaryGradient.createShader(
                              const Rect.fromLTWH(0.0, 0.0, 200.0, 20.0),
                            ),
                        ),
                      ),
                    ],
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
