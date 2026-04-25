import 'package:flutter/material.dart';

class Myspace extends StatelessWidget {

  final Function onTap;
  final String text;
  const Myspace({super.key,required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: Color(0xffF0F0F0),
          ),
        ),
        GestureDetector(
          onTap: () {
           onTap();
          },
          child: Icon(
            Icons.arrow_forward_ios_rounded,
            color: Color(0xffC0C1C3),
            weight: 20,
          ),
        ),
      ],
    );
  }
}

