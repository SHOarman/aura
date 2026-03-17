import 'package:flutter/material.dart';

class CustomGradientButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomGradientButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: 62,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          gradient: const LinearGradient(
            colors: [
              Color(0xFF4C65E3),
              Color(0xFFD75BE3),
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),

          border: Border.all(
            color: Colors.white.withOpacity(0.2),
            width: 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.play_arrow_rounded,
              color: Colors.white,
              size: 30,
            ),
            const SizedBox(width: 8),
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}