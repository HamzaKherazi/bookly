import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/profile/presentation/views/widgets/action_button.dart';
import 'package:flutter/material.dart';

class OrderFooter extends StatelessWidget {
  final double total;
  final VoidCallback onDetailsTap;

  const OrderFooter({
    super.key,
    required this.total,
    required this.onDetailsTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Total: \$${total.toStringAsFixed(2)}',
          style: Styles.textStyle18.copyWith(fontWeight: FontWeight.bold),
        ),
        ActionButton(
          icon: Icons.receipt_long_outlined,
          label: 'Details',
          onTap: onDetailsTap,
        ),
      ],
    );
  }
}
