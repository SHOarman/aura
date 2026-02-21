import 'package:aura/core/routes/app_routes.dart';
import 'package:aura/core/services/globelcontroller.dart';
import 'package:aura/globelwidgets/custombutton.dart';
import 'package:aura/presentation/screeen_ui/screenwidgets/CustomChoiceChip.dart';
import 'package:aura/presentation/screeen_ui/screenwidgets/customImageCard.dart';
import 'package:aura/presentation/screeen_ui/screenwidgets/describebox.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class Writemyscript extends StatelessWidget {
  const Writemyscript({super.key});

  @override
  Widget build(BuildContext context) {
    final Globelcontroller controller = Get.put(Globelcontroller());

    final List<Map<String, String>> imageData = [
      {"title": "Clam Sea", "path": "assets/images/Rectangle 6 (1).png"},
      {"title": "Peaceful Forest", "path": "assets/images/Rectangle 6 (2).png"},
      {"title": "Cosmos", "path": "assets/images/Rectangle 6 (3).png"},
    ];
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 60),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => Get.back(),
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 20,
                        ),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        "Create a Visualization",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color(0xffF0F0F0),
                        ),
                      ),
                    ],
                  ),

                  GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.profile);
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Image.asset(
                        "assets/images/Ellipse 1.png",
                        height: 45,
                        width: 45,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 32),
              Text(
                "Write your visualization",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 20),

              //==================Describe box===============================
              Describebox(
                hintex:
                    'Describe what you want to hear during your visualization..',
              ),

              SizedBox(height: 32),

              //====================================Choose an ambience=====================================================
              const Text(
                "Choose an ambience",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 20),

              SizedBox(
                height: 120,
                child: Obx(() {
                  int selected = controller.selectedIndex.value;
                  print(selected);

                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemCount: imageData.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: CustomImageCard(
                          imagePath: imageData[index]['path']!,
                          title: imageData[index]['title']!,
                          isSelected: selected == index,
                          onTap: () => controller.selectImage(index),
                        ),
                      );
                    },
                  );
                }),
              ),
              const SizedBox(height: 40),
              Obx(
                () => Row(
                  children: [
                    Expanded(
                      child: CustomSelectButton(
                        label: 'With music',
                        isSelected: controller.selectedButtonIndex.value == 0,
                        onTap: () => controller.selectButton(0),
                        isRadio: true,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: CustomSelectButton(
                        label: 'Without music',
                        isSelected: controller.selectedButtonIndex.value == 1,
                        onTap: () => controller.selectButton(1),
                        isRadio: true,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),
              const Text(
                "Choose a voice",
                style: TextStyle(
                  color: Color(0xffF0F0F0),
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 20),

              Obx(
                () => Row(
                  children: [
                    Expanded(
                      child: CustomSelectButton(
                        label: 'Female voice',
                        isSelected: controller.selectedvoicesIndex.value == 0,
                        onTap: () => controller.selectedvoice(0),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: CustomSelectButton(
                        label: 'Male voice',
                        isSelected: controller.selectedvoicesIndex.value == 1,
                        onTap: () => controller.selectedvoice(1),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),
              const Text(
                "Visualization duration",
                style: TextStyle(
                  color: Color(0xffF0F0F0),
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 20),

              Obx(
                () => Row(
                  children: [
                    Expanded(
                      child: CustomSelectButton(
                        label: '5 min',
                        isSelected: controller.durationIndex.value == 0,
                        onTap: () => controller.selectedduration(0),
                      ),
                    ),
                    const SizedBox(width: 6),
                    Expanded(
                      child: CustomSelectButton(
                        label: '10 min',
                        isSelected: controller.durationIndex.value == 1,
                        onTap: () => controller.selectedduration(1),
                      ),
                    ),
                    const SizedBox(width: 6),
                    Expanded(
                      child: CustomSelectButton(
                        label: '15 min',
                        isSelected: controller.durationIndex.value == 2,
                        onTap: () => controller.selectedduration(2),
                      ),
                    ),
                    const SizedBox(width: 6),
                    Expanded(
                      child: CustomSelectButton(
                        label: '20 min',
                        isSelected: controller.durationIndex.value == 3,
                        onTap: () => controller.selectedduration(3),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),

              Custombutton(
                text: "Create audio from my text",
                ontap: () {},
                gradient: LinearGradient(
                  colors: [Color(0xFF4A6CF7), Color(0xFFC159E1)],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
