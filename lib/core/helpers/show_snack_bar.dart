import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

void showSnackBar(
  BuildContext context, {
  required String title,
  IconData? icon,
  Color backgroundColor = const Color.fromARGB(255, 195, 113, 12),
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: backgroundColor,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      duration: const Duration(seconds: 2),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              title,
              style: Styles.textStyle14.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          if (icon != null) Icon(icon, color: Colors.white),
        ],
      ),
    ),
  );
}
