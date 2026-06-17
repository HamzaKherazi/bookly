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
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          if (icon != null) Icon(icon, color: Colors.white),
        ],
      ),
    ),
  );
}
