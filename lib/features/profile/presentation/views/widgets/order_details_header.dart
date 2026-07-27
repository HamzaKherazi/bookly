import 'dart:ui' show FontWeight;

import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/profile/presentation/views/widgets/order_status.dart';
import 'package:bookly/features/profile/presentation/views/widgets/order_status_badge.dart';
import 'package:flutter/material.dart';

class OrderDetailsHeader extends StatelessWidget {
  const OrderDetailsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            'Order #BK-2024-001',
            style: Styles.textStyle20.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(width: 8),
        OrderStatusBadge(status: OrderStatus.delivered),
      ],
    );
  }
}
