import 'package:aura/core/routes/app_routes.dart';
import 'package:aura/presentation/splash_screen/widgets/preparationCard.dart';
import 'package:aura/presentation/splash_screen/widgets/quickmentalsessionscard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Onlodaingscreen5 extends StatelessWidget {
  const Onlodaingscreen5({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Scaffold(
        appBar: AppBar(
          leading: ElevatedButton.icon(
            onPressed: () {
              Get.back();
            },
            label: Icon(Icons.arrow_back_ios,color: Colors.white,size: 18,),

          ),
        ),
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 12),
              Text(
                "Preparation starts now.",
                style: TextStyle(
                  color: Color(0xffFFFFFF),
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),

              SizedBox(height: 24),

              //====================================PreparationCard===========================================
              PreparationCard(
                ontap: () {
                 Get.toNamed(AppRoutes.onlodaingscreen6);
                },
              ),

              SizedBox(height: 40),
              Text(
                "Quick Mental Sessions",
                style: TextStyle(
                  color: Color(0xffFFFFFF),
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 24),

              //===========================================Quickmentalsessionscard==================================================//
              Quickmentalsessionscard(
                ontap: () {

                  Get.toNamed(AppRoutes.preperformancefocusdetelsscreen);
                },
                name: 'Pre-Performance Focus',
              ),

              SizedBox(height: 10,),
              Quickmentalsessionscard(
                ontap: () {},
                name: 'Confidence Reset',
              ),
              SizedBox(height: 10,),
              Quickmentalsessionscard(
                ontap: () {},
                name: 'Pressure Control',
              ),

            ],
          ),
        ),
      ),
    );
  }
}
