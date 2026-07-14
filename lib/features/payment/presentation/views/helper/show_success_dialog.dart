import 'package:bookly/features/payment/presentation/views/widgets/success_dialog.dart';
import 'package:flutter/material.dart';

void showSuccessDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => const SuccessDialog(
      orderId: 'P87Yh', // In production, use widget.orderId
    ),
  );
}
