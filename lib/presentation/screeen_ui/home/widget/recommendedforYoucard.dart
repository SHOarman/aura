import 'package:aura/core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Recommendedforyoucard extends StatefulWidget {
  final String title;
  final String subTitle;
  final String category;
  final String duration;
  final String imagePath;
  final VoidCallback onTap;

  const Recommendedforyoucard({
    super.key,
    required this.title,
    required this.subTitle,
    required this.category,
    required this.duration,
    required this.imagePath,
    required this.onTap,
  });

  @override
  State<Recommendedforyoucard> createState() => _RecommendedforyoucardState();
}

class _RecommendedforyoucardState extends State<Recommendedforyoucard> {
  bool isFavorite = false;

  void _showCustomMenu(BuildContext context, TapDownDetails details) {
    final Color popupBgColor = const Color(0xFF1B1424);

    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
        details.globalPosition.dx,
        details.globalPosition.dy,
        details.globalPosition.dx + 1,
        details.globalPosition.dy + 1,
      ),
      color: popupBgColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: const Color(0xFF574074), width: 0.5),
      ),
      items: [
        PopupMenuItem(
          value: 'favorite',
          child: Row(
            children: [
              Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.redAccent : Colors.white,
                // color: isFavorite ? Colors.green : Colors.white70,
                size: 20,
              ),
              const SizedBox(width: 10),
              const Text(
                "Add to favorite",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
        PopupMenuItem(
          value: 'delete',
          child: Row(
            children: const [
              Icon(Icons.delete_outline, color: Colors.redAccent, size: 20),
              const SizedBox(width: 10),
              Text("Delete", style: TextStyle(color: Colors.redAccent)),
            ],
          ),
        ),
      ],
    ).then((value) {
      if (value == 'favorite') {
        setState(() {
          isFavorite = !isFavorite;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(AppRoutes.preperformancefocusdetelsscreen),
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white.withOpacity(0.1)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    widget.imagePath,
                    width: 84,
                    height: 84,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 6,
                  left: 6,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                          size: 14,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          widget.duration,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.category,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.6),
                          fontSize: 14,
                        ),
                      ),
                      GestureDetector(
                        onTapDown: (details) =>
                            _showCustomMenu(context, details),
                        child: const Icon(
                          Icons.more_horiz,
                          color: Colors.white70,
                          size: 24,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Text(
                    widget.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    widget.subTitle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Color(0xffF0F0F0),
                      fontSize: 13,
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
