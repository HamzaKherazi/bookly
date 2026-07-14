import 'package:flutter/material.dart';

void showErrorSnackbar(BuildContext context, String error) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('Payment failed: $error'),
      backgroundColor: Colors.red,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.all(16),
    ),
  );
}
