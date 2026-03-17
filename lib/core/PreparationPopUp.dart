import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class PreparationPopUp extends StatelessWidget {
  final String title;
  final String imagePath;

  const PreparationPopUp({super.key, required this.title, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xFF1B1424),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
        side: const BorderSide(color: Color(0xFF574074), width: 1),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Crafting your preparation...".tr,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white70, fontSize: 14),
          ),
          if (title.isNotEmpty) ...[
            const SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
          const SizedBox(height: 30),

          // লোগো - এখানে কোনো বর্ডার বা গ্রেডিয়েন্ট সার্কেল নেই
          SizedBox(
            height: 100,
            width: 100,
            child: Image.asset(
              imagePath,
              fit: BoxFit.contain,
            ),
          ),

          const SizedBox(height: 40),

          // লোডিং সার্কেলটি এখানে রাখা হয়েছে
          const SizedBox(
            height: 30,
            width: 30,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFD75BE3)),
              strokeWidth: 2,
            ),
          ),
        ],
      ),
    );
  }
}