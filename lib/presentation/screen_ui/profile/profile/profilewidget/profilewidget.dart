import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Profilewidget extends StatelessWidget {
  final String text;
  final String icon;
  final VoidCallback onTap;
  const Profilewidget({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset(icon, height: 24, width: 24, colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn)),
              const SizedBox(width: 15),
              Text(
                text,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ],
          ),

          IconButton(
            onPressed: () {
              onTap();
            },
            icon: const Icon(
              Icons.arrow_forward_ios,
              size: 18,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
