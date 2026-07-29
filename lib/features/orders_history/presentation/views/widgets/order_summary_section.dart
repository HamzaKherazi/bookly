import 'package:bookly/features/orders_history/presentation/views/widgets/summary_row.dart';
import 'package:flutter/material.dart';

class OrderSummarySection extends StatelessWidget {
  const OrderSummarySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!, width: 1),
      ),
      child: const Column(
        children: [
          SummaryRow(label: 'Subtotal', value: '\$54.98'),
          SummaryRow(label: 'Shipping', value: '\$5.00'),
          SummaryRow(label: 'Tax (8%)', value: '\$4.40'),
          Divider(height: 16, color: Colors.grey),
          SummaryRow(label: 'Total', value: '\$64.38', isTotal: true),
        ],
      ),
    );
  }
}
