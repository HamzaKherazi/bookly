import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CardInputField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final IconData icon;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final bool obscureText;

  const CardInputField({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
    required this.icon,
    this.keyboardType,
    this.inputFormatters,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      style: const TextStyle(color: kTextColor1),
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        hintStyle: Styles.textStyle14.copyWith(
          color: kTextColor1.withOpacity(0.3),
        ),
        labelStyle: Styles.textStyle14.copyWith(
          color: kTextColor1.withOpacity(0.6),
          fontSize: 13,
        ),
        prefixIcon: Icon(icon, color: kPrimaryColor.withOpacity(0.5), size: 20),
        filled: true,
        fillColor: kBackgroundColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: kPrimaryColor, width: 1.5),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $label';
        }
        return null;
      },
    );
  }
}
