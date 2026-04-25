import 'package:flutter/material.dart';

class Describebox extends StatelessWidget {
  final String hintex;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  
  const Describebox({super.key, required this.hintex, this.controller, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
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
