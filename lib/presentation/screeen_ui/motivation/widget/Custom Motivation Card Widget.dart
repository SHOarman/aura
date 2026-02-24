import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildMotivationCard({
  required String title,
  required String bgImage,
}) {
  return Container(
    height: 140,
    width: double.infinity,

    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      image: DecorationImage(
        image: AssetImage(bgImage),
        fit: BoxFit.cover,
      ),
    ),
    child: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.black.withOpacity(0.3),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  height: 45,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.white.withOpacity(0.2)),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 8),

                      ShaderMask(
                        shaderCallback: (bounds) => const LinearGradient(
                          colors: [Color(0xFFF260FF), Color(0xFF5873FF)],
                        ).createShader(bounds),
                        child: const Icon(Icons.play_arrow_rounded, color: Colors.white, size: 30),
                      ),

                      const SizedBox(width: 5),

                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: List.generate(20, (index) {
                            bool isPlayed = index < 16;

                            return Container(
                              width: 3,
                              height: (index % 3 == 0) ? 18 : (index % 2 == 0 ? 10 : 14),
                              decoration: BoxDecoration(
                                gradient: isPlayed
                                    ? const LinearGradient(
                                  colors: [Color(0xFFF260FF), Color(0xFF5873FF)],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                )
                                    : null,
                                color: isPlayed ? null : Colors.grey.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            );
                          }),
                        ),
                      ),
                      const SizedBox(width: 12),
                    ],
                  ),
                )
              ),
            ],
          ),
        ),
      ],
    ),
  );
}