import 'package:bookly/features/payment/presentation/views/widgets/success_dialog.dart';
import 'package:flutter/material.dart';

void showSuccessDialog(BuildContext context, {required int orderId}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) =>  SuccessDialog(
      orderId: orderId, // In production, use widget.orderId
    ),
  );
}
