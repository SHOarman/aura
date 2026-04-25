import 'package:concentrao/core/routes/app_routes.dart';
import 'package:concentrao/core/services/globelcontroller.dart';
import 'package:concentrao/globelwidgets/custombutton.dart';
import 'package:concentrao/presentation/screen_ui/screenwidgets/custom_choice_chip.dart';
import 'package:concentrao/presentation/screen_ui/screenwidgets/custom_image_card.dart';
import 'package:concentrao/presentation/screen_ui/screenwidgets/describebox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Startwithai extends StatefulWidget {
  const Startwithai({super.key});

  @override
  State<Startwithai> createState() => _StartwithaiState();
}

class _StartwithaiState extends State<Startwithai> {
  final Globelcontroller controller = Get.put(Globelcontroller());
  final RxString inputText = ''.obs;

  @override
  Widget build(BuildContext context) {

    final List<Map<String, String>> imageData = [
      {"title": "Clam Sea", "path": "assets/images/Rectangle 6 (1).png"},
      {"title": "Peaceful Forest", "path": "assets/images/Rectangle 6 (2).png"},
      {"title": "Cosmos", "path": "assets/images/Rectangle 6 (3).png"},
    ];

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
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
                    onTap: () => Get.toNamed(AppRoutes.profile),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white24, width: 1),
                      ),
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
                  ),
                ],
              ),

              const SizedBox(height: 32),
              const Text(
                "What is your goal?",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 20),
              Describebox(
                hintex: 'Describe what you want to experience or achieve...',
                onChanged: (val) => inputText.value = val,
              ),

              const SizedBox(height: 30),
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

              Obx(() => Custombutton(
                text: "Generate my visualization",
                ontap: inputText.value.trim().isEmpty ? () {} : () {},
                gradient: inputText.value.trim().isEmpty 
                    ? null 
                    : const LinearGradient(colors: [Color(0xFF4A6CF7), Color(0xFFC159E1)]),
                backgroundColor: inputText.value.trim().isEmpty ? const Color(0xFF2E2C3D) : null,
              )),
              const SizedBox(height: 20),


            ],
          ),
        ),
      ),
    );
  }
}
