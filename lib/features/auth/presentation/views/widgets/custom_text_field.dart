import 'package:bookly/constants.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {

final String hintText;

  const CustomTextField({super.key, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(fontSize: 16),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Color.fromARGB(255, 123, 123, 123)),

        contentPadding: const EdgeInsets.symmetric(
          vertical: 14,
          horizontal: 16,
        ),

        filled: true,
        fillColor: Colors.white,

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(width: 0.25),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: kPrimaryColor, width: 1.2),
        ),

        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
      ),
    );
  }
}
