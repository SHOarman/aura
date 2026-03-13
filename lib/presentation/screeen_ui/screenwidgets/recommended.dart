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



class liberycard extends StatefulWidget {
  final String title;
  final String imagepagth;
  final VoidCallback ontap;
  final String titlenew; // Custom titlenew variable

  const liberycard({
    super.key,
    required this.imagepagth,
    required this.title,
    required this.ontap,
    required this.titlenew, // Constructor e add kora hoyeche
  });

  @override
  State<liberycard> createState() => _liberycard();
}

class _liberycard extends State<liberycard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    const Color unselectedColor = Color(0xFF8E8F92);
    const List<Color> gradientColors = [Color(0xFFD75BE3), Color(0xFF4C65E3)];

    return GestureDetector(
      onTap: widget.ontap,
      child: Container(
        width: 250,
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
                  height: 120,
                  width: 240,
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
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: Color(0xffD9DADB),
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
                    child: const Icon(Icons.favorite, color: Colors.white, size: 16),
                  )
                      : const Icon(Icons.favorite, color: unselectedColor, size: 16),
                ),
              ],
            ),
            const SizedBox(height: 2),

            // Eikhane titlenew add kora hoyeche
            Text(
              widget.titlenew,
              style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFFFCFDFD),
                  fontWeight: FontWeight.w500),
            ),

            const SizedBox(height: 4),
            const Text(
              "Prepare your mind before important\n moments.",
              style: TextStyle(
                fontSize: 9,
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