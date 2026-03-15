import 'package:aura/presentation/screeen_ui/library/widget/GradientBorderContainer.dart';
import 'package:aura/presentation/screeen_ui/library/widget/methodcard.dart';
import 'package:flutter/material.dart';
// card widget file ta import koro ekhane

class LibraryHistorique extends StatelessWidget {
  const LibraryHistorique({super.key});

  @override
  Widget build(BuildContext context) {

    return ListView(
      children: [
        const Text(
          "Continue Training",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 16),

        //========================================Continue Training Card========================================================

        MethodCard(onTap: (){}),


        SizedBox(height: 24),
        Text(
          'Saved Sessions',
          style: TextStyle(
            color: Color(0xffFFFFFF),
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
        ),

        SizedBox(height: 12,),

        //========================================GradientBorderContainer========================================================

       GradientBorderContainer(title: 'Soccer Tournament Focus', subtitle: '15 min · Guided', onTap: () { print("yes done"); },),
        SizedBox(height: 12,),
        GradientBorderContainer(title: 'Soccer Tournament Focus', subtitle: '8 min · Custom', onTap: () { print("8 min · Custom"); },),
        SizedBox(height: 12,),
        GradientBorderContainer(title: 'Soccer Tournament Focus', subtitle: '20 min · Guided', onTap: () { print("20 min · Guided"); },),
        SizedBox(height: 12,),
        GradientBorderContainer(title: 'Soccer Tournament Focus', subtitle: '10 min · Custom', onTap: () { print("10 min · Custom"); },),


      ],
    );
  }
}
