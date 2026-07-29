import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/orders_history/presentation/views/widgets/order_status.dart';
import 'package:bookly/features/orders_history/presentation/views/widgets/order_status_badge.dart';
import 'package:flutter/widgets.dart';

class OrderHeader extends StatelessWidget {
  const OrderHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Order #BK-2024-001',
              style: Styles.textStyle16.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 2),
            Text(
              'Dec 15, 2024 • 2 items',
              style: Styles.textStyle14.copyWith(color: kTextColor2),
            ),
          ],
        ),
        OrderStatusBadge(status: OrderStatus.delivered),
      ],
    );
  }
}
