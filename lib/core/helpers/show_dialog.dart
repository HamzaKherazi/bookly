import 'package:bookly/core/widgets/custom_dialog.dart';
import 'package:flutter/material.dart';

void showCustomDialog(
  BuildContext context, {
  required String title,
  required String message,
}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => CustomDialog(
      title: title,
      message: message,
      onPressed: () {
        Navigator.pop(context);
      },
    ),
  );
}
