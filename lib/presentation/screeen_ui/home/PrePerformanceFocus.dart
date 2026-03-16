import 'package:aura/presentation/screeen_ui/home/widget/seealldata.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../core/routes/app_routes.dart';
import '../screenwidgets/recommended.dart';

class Preperformancefocus extends StatelessWidget {
  const Preperformancefocus({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 70,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20, top: 8, bottom: 8),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withOpacity(0.1),
            ),
            child: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.white,
                size: 18,
              ),
            ),
          ),
        ),
        title: Text(
          "pre_performance_focus".tr,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      print("filter====================");
                    },
                    child: SvgPicture.asset(
                      "assets/icon/filter.svg",
                      height: 20,
                      width: 20,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    "filter".tr,
                    style: const TextStyle(
                      color: Color(0xffF0F0F0),
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 12),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(10),
                    itemCount: 6,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          mainAxisExtent: 220,
                        ),
                    itemBuilder: (context, index) {
                      return LiberyCard(
                        title: 'mental_preparation'.tr,
                        ontap: () {
                          Get.toNamed(
                            AppRoutes.preperformancefocusdetelsscreen,
                          );
                        },
                        imagePath: 'assets/images/new.png',
                        subTitle: 'Pre-Performance Focus',
                        description:
                            'Prepare your mind before important moments.',
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
