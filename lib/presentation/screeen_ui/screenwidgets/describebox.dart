import 'package:flutter/material.dart';

class Describebox extends StatelessWidget {
  final String hintex;
   Describebox({super.key, required this.hintex});

  @override
  Widget build(BuildContext context) {
    return TextFormField(

      maxLines: 5,
      decoration: InputDecoration(
        focusColor: Color(0xff21242A),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        fillColor: Color(0xff21242A),
        filled: true,
        hintText: hintex,


      ),
    );
  }
}
