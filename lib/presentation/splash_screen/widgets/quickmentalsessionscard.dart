import 'package:aura/core/services/globelcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Quickmentalsessionscard extends StatelessWidget {
  final VoidCallback ontap;
  final String name;

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
          height: 56,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            // GRADIENT BORDER LOGIC
            gradient: isSelected
                ?  LinearGradient(colors: [Colors.white38, Colors.white38])
                :  LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                // Color(0x804C65E3), // #4C65E3 at 50%
                // Color(0x33D75BE9),
                Color(0xFF4C65E3)..withOpacity(0.4), Color(0xFFD75BE3)..withOpacity(0.6)
                // #D75BE3 at 20%
              ],
            ),
          ),
          child: Container(
            margin: const EdgeInsets.all(1.5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(11),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: isSelected
                    ? const [Color(0xFFD75BE3), Color(0xFF4C65E3)]
                    : const [Color(0xFF1B1424), Color(0xFF1B1424)],
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
          ),
        );
      }),
    );
  }
}