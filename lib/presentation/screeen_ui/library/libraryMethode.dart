import 'package:aura/presentation/screeen_ui/library/widget/theauraframework.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Librarymethode extends StatelessWidget {
  const Librarymethode({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: .start,
            crossAxisAlignment: .start,




            children: [
               Text(
                "The Aura Framework",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500
                ),
              ),
              const SizedBox(height: 16),

              //============================== The Aura Framework Cards ===========================
              Theauraframework(
                title: 'Pre-Performance Routine',
                bulletPoints: const [
                  'Apprendre à gérer son stress',
                  'Respirations guidées',
                  'Focus sur le moment présent',
                ],
                onTap: () {
                  print("Card 1 Tapped!");
                },
              ),

              const SizedBox(height: 16),
              Theauraframework(
                title: 'Confidence Reinforcement',
                bulletPoints: const [
                  'Renforcer l\'estime de soi',
                  'Affirmations positives',
                  'Visualisation de réussite',
                ],
                onTap: () {
                  print("Card 2 Tapped!");
                },
              ),

              const SizedBox(height: 16),
              Theauraframework(
                title: 'Pressure Control',
                bulletPoints: const [
                  'Concentration profonde',
                  'Élimination des distractions',
                  'Techniques de tunnel vision',
                ],
                onTap: () {
                  print("Card 3 Tapped!");
                },
              ),

              const SizedBox(height: 20),
              Theauraframework(
                title: 'Peak State Activation',
                bulletPoints: const [
                  'Énergie maximale',
                  'Préparation mentale flash',
                  'Activation du corps et de l\'esprit',
                ],
                onTap: () {
                  print("Card 4 Tapped!");
                },
              ),




            ],

        ),
      ),
    );
  }
}
