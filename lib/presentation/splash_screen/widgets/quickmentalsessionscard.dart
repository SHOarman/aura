import 'package:aura/core/services/globelcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Quickmentalsessionscard extends StatelessWidget {
  final VoidCallback ontap;
  final String name;

  // Initialize the controller
  final Globelcontroller controller = Get.put(Globelcontroller());

  Quickmentalsessionscard({
    super.key,
    required this.ontap,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.selectSession(name);
        ontap();
      },
      child: Obx(() {

        bool isSelected = controller.selectedSession.value == name;

        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.fromLTRB(16, 18, 16, 18),
          height: 56,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: isSelected
                  ? const [Color(0xFFD75BE3), Color(0xFF4C65E3)]
                  : const [Color(0x991B1424), Color(0x4D574074)],
            ),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isSelected ? Colors.white38 : const Color(0x4D574074),
              width: 1,
            ),
          ),
          child: Center(
            child: Text(
              name,
              style: const TextStyle(
                color: Color(0xffFFFFFF),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        );
      }),
    );
  }
}