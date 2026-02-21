import 'package:flutter/material.dart';

class VisualizationCard extends StatelessWidget {
  final String boldtext;
  final String text;
  final String iconename;
  final VoidCallback onTap;
   VisualizationCard({super.key, required this.boldtext, required this.text, required this.onTap, required this.iconename});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343,
      height: 363,
        padding: const EdgeInsets.only(bottom: 20.0),

      decoration: BoxDecoration(
        color: const Color(0xFF21242A),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              "assets/images/Rectangle 5.png",
              height: 170,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(height: 20),

           Text(
            boldtext,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),

          const SizedBox(height: 10),

           Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),

          const SizedBox(height: 25),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Container(
              width: double.infinity,
              height: 52,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF4A6CF7),
                    Color(0xFFC159E1),
                  ],
                ),
              ),
              child: ElevatedButton(
                onPressed: () {
                  onTap();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child:  Text(
                 iconename ,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}