import 'package:aura/globelwidgets/custombutton.dart';
import 'package:aura/presentation/splash_screen/widgets/onlodingcard.dart';
import 'package:flutter/material.dart';

class Onlodingscreen3 extends StatelessWidget {
  const Onlodingscreen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              SizedBox(height: 110),

              Center(
                child: Text(
                  "What are you preparing for?",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),

              SizedBox(height: 30),

              Onlodingcard(
                title: "Athletic Performance",
                subtitle: "Perform with clarity and composure.",
                onTap: () {},
              ),

              SizedBox(height: 8),
              Onlodingcard(
                title: "Business & Leadership",
                subtitle: "Execute with confidence under pressure.",
                onTap: () {},
              ),
              SizedBox(height: 8),
              Onlodingcard(
                title: "Competitive Exams",
                subtitle: "Maintain focus when it matters most.",
                onTap: () {

                },
              ),
              SizedBox(height: 8),
              Onlodingcard(
                title: "Personal Mastery",
                subtitle: "Build discipline and mental resilience.",
                onTap: () {},
              ),

              SizedBox(height: 200),

              Custombutton(
                text: "Continue",
                ontap: () {

                  //=========================================================
                },
                gradient: LinearGradient(
                  colors: [Color(0xFF4A6CF7), Color(0xFFC159E1)],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
