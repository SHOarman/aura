import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Recommendedforyoucard extends StatefulWidget {
  final String title;
  final String subTitle;
  final String duration;
  final String imagePath;
  final VoidCallback onTap;
  final VoidCallback? onEdit;

  const Recommendedforyoucard({
    super.key,
    required this.title,
    required this.subTitle,
    required this.duration,
    required this.imagePath,
    required this.onTap,
    this.onEdit,
  });

  @override
  State<Recommendedforyoucard> createState() => _RecommendedforyoucardState();
}

class _RecommendedforyoucardState extends State<Recommendedforyoucard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    const Color popupBgColor = Color(0xFF1B1424);

    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFD75BE3), Color(0xFF4C65E3)],
          ),
        ),
        child: Container(
          margin: const EdgeInsets.all(1.2),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color(0xFF1B1424),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // --- Image Section ---
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      widget.imagePath,
                      width: 75,
                      height: 75,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 4,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.5),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                            size: 12,
                          ),
                          const SizedBox(width: 2),
                          Text(
                            widget.duration,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 9,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 14),

              // --- Content Section ---
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Title and Three-Dot Menu in the same Row
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            widget.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Theme(
                          data: Theme.of(context).copyWith(
                            cardColor: popupBgColor,
                          ),
                          child: PopupMenuButton<String>(
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(minWidth: 150),
                            tooltip: "",
                            icon: const Icon(
                              Icons.more_horiz,
                              color: Colors.white70,
                              size: 22,
                            ),
                            offset: const Offset(0, 30),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                              side: const BorderSide(
                                color: Color(0xFF574074),
                                width: 0.5,
                              ),
                            ),
                            onSelected: (value) {
                              if (value == 'favorite') {
                                setState(() => isFavorite = !isFavorite);
                              } else if (value == 'edit') {
                                if (widget.onEdit != null) widget.onEdit!();
                              }
                            },
                            itemBuilder: (context) => [
                              _buildMenuItem(
                                'favorite',
                                isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                "Add to favorite".tr,
                                isFavorite ? Colors.redAccent : Colors.white,
                              ),
                              _buildMenuItem(
                                'edit',
                                Icons.edit_outlined,
                                "Edit".tr,
                                Colors.white,
                              ),
                              _buildMenuItem(
                                'delete',
                                Icons.delete_outline,
                                "Delete".tr,
                                Colors.redAccent,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    // Subtitle positioned below the title row
                    Text(
                      widget.subTitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Color(0xffB0B0B0),
                        fontSize: 12,
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

  PopupMenuItem<String> _buildMenuItem(
      String value,
      IconData icon,
      String title,
      Color color,
      ) {
    return PopupMenuItem(
      value: value,
      child: Row(
        children: [
          Icon(icon, color: color, size: 18),
          const SizedBox(width: 10),
          Text(
            title,
            style: TextStyle(color: color, fontSize: 13),
          ),
        ],
      ),
    );
  }
}