import 'package:concentrao/core/services/globelcontroller.dart';
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
    return Obx(() {
      bool isSelected = controller.selectedSession.value == name;

      return AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: 56,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          // GRADIENT BORDER LOGIC
          gradient: isSelected
              ? const LinearGradient(colors: [Colors.white38, Colors.white38])
              : LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(0xFF4C65E3).withValues(alpha: 0.4),
              const Color(0xFFD75BE3).withValues(alpha: 0.6),
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
          // --- CLICK EFFECT ADDED HERE ---
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(11),
              onTap: () {
                controller.selectSession(name);
                ontap();
              },
              splashColor: Colors.white.withValues(alpha: 0.1),
              highlightColor: Colors.white.withValues(alpha: 0.05),
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
          ),
        ),
      );
    });
  }
}