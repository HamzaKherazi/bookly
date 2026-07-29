import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

class OrderSummaryCard extends StatelessWidget {
  const OrderSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    final totalOrders = 10;
    final inTransit = 1;
    final delivered = 2;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SummaryItem(
            icon: Icons.shopping_bag_outlined,
            value: totalOrders.toString(),
            label: 'Total Orders',
          ),
          SummaryItem(
            icon: Icons.local_shipping_outlined,
            value: inTransit.toString(),
            label: 'In Transit',
          ),
          SummaryItem(
            icon: Icons.check_circle_outline,
            value: delivered.toString(),
            label: 'Delivered',
          ),
        ],
      ),
    );
  }
}

class SummaryItem extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;

  const SummaryItem({
    super.key,
    required this.icon,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: kPrimaryColor, size: 24),
        const SizedBox(height: 4),
        Text(
          value,
          style: Styles.textStyle18.copyWith(fontWeight: FontWeight.bold),
        ),
        Text(
          label,
          style: Styles.textStyle14.copyWith(
            color: kTextColor2,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
