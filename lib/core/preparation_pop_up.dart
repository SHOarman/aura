import 'package:flutter/material.dart';

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
          // Text(
          //   "Crafting your preparation...".tr,
          //   textAlign: TextAlign.center,
          //   style: const TextStyle(color: Colors.white70, fontSize: 14),
          // ),
          if (title.isNotEmpty) ...[
            const SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
          const SizedBox(height: 30),

          Container(
            height: 120,
            width: 120,
            padding: const EdgeInsets.all(4),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [Color(0xFF4C65E3), Color(0xFFD75BE3)],
              ),
            ),
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF1B1424),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(60),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  errorBuilder: (c, e, s) => const Icon(
                    Icons.auto_awesome,
                    size: 50,
                    color: Colors.white24,
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 40),

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
