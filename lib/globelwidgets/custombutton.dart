import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Custombutton extends StatelessWidget {
  final String text;
  final VoidCallback ontap;
  final String? iconPath;

  final Color? backgroundColor;
  final Gradient? gradient;

  const Custombutton({
    super.key,
    required this.text,
    required this.ontap,
    this.iconPath,
    this.backgroundColor,
    this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: ontap,
        borderRadius: BorderRadius.circular(99),
        child: Ink(
          height: 56,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(99),
            color: gradient == null ? (backgroundColor ?? Colors.blue) : null,
            gradient: gradient,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (iconPath != null) ...[
                SvgPicture.asset(
                  iconPath!,
                  height: 20,
                  width: 20,
                  colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
                const SizedBox(width: 10),
              ],
              Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}