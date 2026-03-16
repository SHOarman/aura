import 'dart:ui';
import 'package:flutter/material.dart';

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

        width:250,
        height: 244,
        margin: const EdgeInsets.only(right: 6),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                widget.imagepagth,
                height: 120,
               width: 240,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 155,
                  color: Colors.white10,
                  child: const Icon(Icons.broken_image, color: Colors.white54),
                ),
              ),
            ),

            const SizedBox(height: 12),

            Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color:Color(0xffD9DADB),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                GestureDetector(
                  onTap: () => setState(() => isFavorite = !isFavorite),
                  child: isFavorite
                      ? ShaderMask(
                    shaderCallback: (bounds) => const LinearGradient(
                      colors: gradientColors,
                    ).createShader(bounds),
                    child: const Icon(Icons.favorite, color: Colors.white, size: 22),
                  )
                      : const Icon(Icons.favorite, color: unselectedColor, size: 22),
                ),
              ],
            ),

            const SizedBox(height: 4),

            Row(
              children: [

                const Text(
                  "Pre-Performance Focus",
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFFFCFDFD),
                    fontWeight: FontWeight.w500
                  ),
                ),
              ],
            ),

            const SizedBox(height: 4),

            const Text(
              "Prepare your mind before important\n moments.",
              style: TextStyle(
                fontSize: 11,
                color: Color(0xFF8E8F92),
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}



//===================================================================================================================







class LiberyCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final String description;
  final String imagePath;
  final VoidCallback ontap;

  const LiberyCard({
    super.key,
    required this.title,
    required this.subTitle,
    required this.description,
    required this.imagePath,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0x804C65E3).withOpacity(0.4),
              const Color(0x33D75BE3).withOpacity(0.6),
            ],
          ),
        ),
        child: Container(
          margin: const EdgeInsets.all(1.2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(23),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF1B1424),
                Color(0xFF2D213A),
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Image Section
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        imagePath,
                        height: 110,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: 8,
                      left: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.play_arrow, color: Colors.white, size: 14),
                            SizedBox(width: 4),
                            Text(
                              "15 min",
                              style: TextStyle(color: Colors.white, fontSize: 11),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Text Section
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      maxLines: 1,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                        fontSize: 10,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subTitle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        height: 1.1,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.6),
                        fontSize: 11,
                        height: 1.2,
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