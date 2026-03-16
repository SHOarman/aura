import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PreparationCard extends StatelessWidget {
  final Function ontap;
  const PreparationCard({super.key, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 355,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient:  LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF4C65E3)..withOpacity(0.4), Color(0xFFD75BE3)..withOpacity(0.6)],
        ),
      ),
      child: Container(
        margin: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          color: Color(0xFF1B1424),
          borderRadius: BorderRadius.circular(11),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(11),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                color: Colors.transparent,
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'continue_your_preparation'.tr,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'last_session'.tr,
                      style: const TextStyle(
                        color: Color(0xffD9DADB),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),

              Divider(
                height: 1,
                thickness: 1,
                color: Colors.white.withOpacity(0.2),
              ),

              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    // begin: Alignment.topCenter,
                    // end: Alignment.bottomCenter,
                    colors: [
                      Color.fromRGBO(27, 20, 36, 0.6),
                      Color.fromRGBO(87, 64, 116, 0.3),
                    ],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 20.0,
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => ontap(),
                        child: Container(
                          width: 44,
                          height: 44,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              colors: [Color(0xFFD75BE3), Color(0xFF4C65E3)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: const Icon(
                            Icons.play_arrow_rounded,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'begin_your_first_mental_session'.tr,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
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
