import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Recommended extends StatefulWidget {
  final String title;
  final String imagepagth;
  final VoidCallback ontap;

  const Recommended({
    super.key,
    required this.imagepagth,
    required this.title,
    required this.ontap,
  });

  @override
  State<Recommended> createState() => _RecommendedState();
}

class _RecommendedState extends State<Recommended> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    const Color unselectedColor = Color(0xFF8E8F92);
    const List<Color> gradientColors = [Color(0xFFD75BE3), Color(0xFF4C65E3)];

    return GestureDetector(
      onTap: widget.ontap,
      child: Container(
        width: 170,
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          color: const Color(0xFF1E2126),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Section
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.asset(
                widget.imagepagth,
                height: 100,
                width: 170,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 100,
                    width: 170,
                    color: Colors.grey[800],
                    child: const Icon(Icons.broken_image, color: Colors.white54),
                  );
                },
              ),
            ),

            const SizedBox(height: 12),

            // Title & Favorite Icon
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      widget.title,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                    },
                    child: isFavorite
                        ? ShaderMask(
                      shaderCallback: (bounds) => const LinearGradient(
                        colors: gradientColors,
                      ).createShader(bounds),
                      child: const Icon(
                        Icons.favorite,
                        color: Colors.white,
                        size: 20,
                      ),
                    )
                        : const Icon(
                      Icons.favorite,
                      color: unselectedColor,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 8),

            // Time/Duration Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: Row(
                children: [
                  SvgPicture.asset(
                    "assets/icon/time.svg",
                    height: 14,
                    colorFilter: const ColorFilter.mode(
                      Color(0xFFD75BE3),
                      BlendMode.srcIn,
                    ),
                  ),
                  const SizedBox(width: 5),
                  const Text(
                    "28.5 min",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF8E8F92),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


