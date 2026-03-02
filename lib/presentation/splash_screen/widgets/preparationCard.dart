import 'package:flutter/material.dart';

class PreparationCard extends StatelessWidget {

  final Function ontap;
   PreparationCard({super.key, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 355,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0x4D574074),
          width: 1.5,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Container(
              width: double.infinity,
              color: Colors.transparent,
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Continue your preparation',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Last session: Pre-Performance Focus',
                    style: TextStyle(
                      color:Color(0xffD9DADB),
                      fontSize: 16,
                      fontWeight: FontWeight.w400
                    ),
                  ),
                ],
              ),
            ),

            // MIDDLE DIVIDER
            Divider(
              height: 1,
              thickness: 1,
              color: Colors.white.withOpacity(0.1),
            ),

            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0x991B1424),
                    Color(0x4D574074),
                  ],
                ),

              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
                child: Row(
                  children: [

                    GestureDetector(
                      onTap:(){
                        ontap();




                      },
                      child: Container(
                        width: 44,
                        height: 44,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [Color(0xFFD75BE3), Color(0xFF4C65E3)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child:  Icon(
                          Icons.play_arrow_rounded,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    const Text(
                      'Begin your first mental session',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}