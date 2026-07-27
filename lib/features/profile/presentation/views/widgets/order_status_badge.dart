import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/profile/presentation/views/widgets/order_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OrderStatusBadge extends StatelessWidget {
  final String status;

  const OrderStatusBadge({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: OrderStatus.getColor(status),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(OrderStatus.getIcon(status), size: 12, color: Colors.white),
          const SizedBox(width: 4),
          Text(
            OrderStatus.getDisplayName(status),
            style: Styles.textStyle14.copyWith(
              fontWeight: FontWeight.w600,
              color: Colors.white,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}
