import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
    required this.icon,
    this.textInputAction = TextInputAction.next,
  });

  final TextEditingController controller;
  final String label;
  final String hint;
  final IconData icon;
  final TextInputAction textInputAction;

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: Colors.grey[300]!),
    );

    return TextFormField(
      controller: controller,
      style: Styles.textStyle14,

      textInputAction: textInputAction,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: Styles.textStyle14.copyWith(color: Colors.grey[600]),
        hintText: hint,
        hintStyle: Styles.textStyle14.copyWith(color: Colors.grey[600]),
        errorStyle: Styles.textStyle14.copyWith(
          fontSize: 13.sp,
          color: const Color.fromARGB(255, 214, 38, 25),
        ),
        prefixIcon: Icon(icon),
        border: border,
        enabledBorder: border,
        focusedBorder: border.copyWith(
          borderSide: const BorderSide(color: kPrimaryColor, width: 2),
        ),
        filled: true,
        fillColor: Colors.grey[50],
      ),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'this field is required!';
        }
        return null;
      },
    );
  }
}
