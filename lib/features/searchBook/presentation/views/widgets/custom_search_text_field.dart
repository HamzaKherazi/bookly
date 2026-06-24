import 'package:bookly/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(fontFamily: 'Inter', fontSize: 16),
      decoration: InputDecoration(
        hintText: 'Search for books...',
        hintStyle: const TextStyle(
          fontFamily: 'Inter',
          color: Color.fromARGB(255, 123, 123, 123),
        ),

        contentPadding: const EdgeInsets.symmetric(
          vertical: 14,
          horizontal: 16,
        ),

        filled: true,
        fillColor: Colors.white,

        prefixIcon: IconButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back, color: kPrimaryColor),
        ),

        suffixIcon: IconButton(
          highlightColor: Colors.transparent,
          onPressed: () {},
          icon: Icon(
            FontAwesomeIcons.magnifyingGlass,
            size: 18,
            color: kPrimaryColor,
          ),
        ),

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
