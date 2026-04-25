import 'package:flutter/material.dart';

class CustomSelectButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final bool isRadio;

  const CustomSelectButton({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
    this.isRadio = false,
  });

  @override
  Widget build(BuildContext context) {
    // কালার ভেরিয়েবল
    const Color unselectedColor = Color(0xFFC0C1C3);
    const List<Color> gradientColors = [Color(0xFF4C65E3), Color(0xFFC159E1)];

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 55,
        decoration: BoxDecoration(
          color: const Color(0xFF1E2126),
          borderRadius: BorderRadius.circular(30),
          border: isSelected
              ? null
              : Border.all(color: unselectedColor, width: 1.5),
        ),
        child: Container(
          decoration: isSelected
              ? BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.transparent),
            boxShadow: [
            ],
          )
              : null,
          child: Stack(
            alignment: Alignment.center,
            children: [
              if (isSelected)
                ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(
                    colors: gradientColors,
                  ).createShader(bounds),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                  ),
                ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    if (isRadio) ...[
                      isSelected
                          ? ShaderMask(
                        shaderCallback: (bounds) => const LinearGradient(
                          colors: gradientColors,
                        ).createShader(bounds),
                        child: const Icon(Icons.radio_button_checked, color: Colors.white, size: 22),
                      )
                          : const Icon(Icons.radio_button_off, color: unselectedColor, size: 22),
                      const SizedBox(width: 10),
                    ],
                    Text(
                      label,
                      style: TextStyle(
                        color: isSelected ? Colors.white : unselectedColor,
                        fontSize: 14,
                        fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
